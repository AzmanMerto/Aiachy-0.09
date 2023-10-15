
//  SplashInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI
import Combine
//MARK: SplashInteractor -  protocol - SplashInteractorServerProtocol
private protocol SplashInteractorServerProtocol {
    func fetchUser(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> () )
}
//MARK: SplashInteractor -  protocol - SplashInteractorCoreDataProtocol
private protocol SplashInteractorCoreDataProtocol {
    func setCoreData(completion: @escaping (Bool) -> ())
}
//MARK: SplashInteractor -  protocol - SplashInteractorNetworkProtocol
private protocol SplashInteractorSetterProtocol {
    func setUserNew(aiachy aiachyState: AiachyState)
}
private protocol SplashInteractorNetworkProtocol {
    func checkNetwork(completion: @escaping (Bool) -> ())
}
//MARK: SplashInteractor - Interactor
class SplashInteractor {
    
    @Published var isCheckedEnthernet: Bool?
    var isHaveError: CurrentValueSubject<Int, Never>
    private let authServerManager: AuthServerManager
    private let zodiacServerManager: ZodiacServerManager
    private let executiveServerManager: ExecutiveServerManager
    private let coreDataManager: CoreDataManager
    private let networkMonitorManager: NetworkMonitorManager
    private var cancellable: AnyCancellable?
    
    init(isHaveError: Int = 5,
         authServerManager: AuthServerManager = AuthServerManager(),
         zodiacServerManager: ZodiacServerManager = ZodiacServerManager(),
         executiveServerManager: ExecutiveServerManager = ExecutiveServerManager(),
         coreDataManager: CoreDataManager = CoreDataManager(),
         networkMonitorManager: NetworkMonitorManager = NetworkMonitorManager())
    {
        //MARK: SplashInteractor ReadMe (isHaveCoreDataErrorType) - If the return value is 0, it indicates an internet problem,
        //MARK: SplashInteractor ReadMe (isHaveCoreDataErrorType) - if it is 1, it indicates the problem that the zodiac data version is not present
        //MARK: SplashInteractor ReadMe (isHaveCoreDataErrorType) - if it is 2, the data is still being loaded.
        //MARK: SplashInteractor ReadMe (isHaveCoreDataErrorType) - if it is 3, cant find user id so that it will be created new user
        self.isHaveError = CurrentValueSubject<Int,Never>(isHaveError)
        self.authServerManager = authServerManager
        self.zodiacServerManager = zodiacServerManager
        self.executiveServerManager = executiveServerManager
        self.coreDataManager = coreDataManager
        self.networkMonitorManager = networkMonitorManager
    }
    /// Controlling interactor process.
    /// - Parameters:
    ///   - aiachyState: if user fetched datas from server it will be setted value.
    ///   - completion: if false its turning handeledError on presenter page else its login successfull
    func controlSplashProcess(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ()) {
        /// checking
        guard self.isCheckedEnthernet ?? false else { self.isHaveError.send(0); completion(false); return }
        
        /// check nethowrk or error
        fetchUser(aiachy: aiachyState) { isFetchedUser in
            /// checking user
            if isFetchedUser {
                self.checkZodiacDataVersionOnUser(aiachy: aiachyState) { isCheckedDataVersion in
                    guard isCheckedDataVersion else { completion(true); return }
                    /// setted core data
                    self.setCoreData { [self] isSettedCoreData in
                        if isSettedCoreData {
                            isHaveError.send(2)
                            completion(false)
                        } else {
                            isHaveError.send(3)
                            completion(false)
                        }
                    }
                }
            } else {
                /// setted core data
                self.setCoreData { [self] isSettedCoreData in
                    if isSettedCoreData {
                        isHaveError.send(2)
                        completion(false)
                    } else {
                        isHaveError.send(3)
                        completion(false)
                    }
                }
            }
        }
    }
}
//MARK: SplashInteractor -  extension - SplashInteractorNetworkProtocol
extension SplashInteractor: SplashInteractorServerProtocol {
    /// Check and fecth user datas.
    /// - Parameters:
    ///   - aiachyState: will setted user local values.
    ///   - completion: if return true user has been found and setted else not found no setted.
    fileprivate func fetchUser(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> () ) {
        guard let userID = aiachyState.user.userInfo.id else { completion(false); return }
        authServerManager.fetchUserWithId(id: userID) { [self] result in
            switch result {
            case .success(let success):
                /// setting data
                aiachyState.user = success
                completion(true)
            case .failure(let failure):
                /// errors
                print(failure.printDataFetching("SplashInteractor"))
                /// new user new value
                setUserNew(aiachy: aiachyState)
                completion(false)
            }
        }
    }
    
    /// Checking zodiac data version
    /// - Parameters:
    ///   - aiachyState: will setting & checking last version zodiac data version
    ///   - completion: if  return true success login else  updating coredata
    fileprivate func checkZodiacDataVersionOnUser(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ()) {
        let checkedCoreData = coreDataManager.controlCoreData()
        
        executiveServerManager.checkZodiacDataVersion(aiachy: aiachyState) { isZodiacDataVersionSame in
            guard isZodiacDataVersionSame else {self.executiveServerManager.updateUserZodiacDataVersion(aiachy: aiachyState); completion(false); return }
            guard checkedCoreData else { completion(false); return }
            completion(true)
        }
    }
}
//MARK: SplashInteractor -  protocol - SplashInteractorCoreDataProtocol
extension SplashInteractor: SplashInteractorCoreDataProtocol {
    /// Setting core data
    /// - Parameter completion: if turn true current updateing
    fileprivate func setCoreData(completion: @escaping (Bool) -> ()) {
        zodiacServerManager.getZodiacFromServer { [self] result in
            switch result {
            case .success(let success):
                coreDataManager.makeCoreDataManaging(zodiac: success)
                completion(true)
            case .failure(let failure):
                print(failure.printDataFetching("SplashInteractor"))
                completion(false)
            }
        }
    }
}
//MARK: SplashInteractor -  extension - SplashInteractorSetterProtocol
extension SplashInteractor: SplashInteractorSetterProtocol {
    /// To set the user's unset data
    /// - Parameter aiachyState: state where values will change
    fileprivate func setUserNew(aiachy aiachyState: AiachyState) {
        /// bundle
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        /// setting value
        aiachyState.user.userSubscription.isSubscriped = false
        aiachyState.user.userSubscription.subscripedMethod = "none"
        aiachyState.user.userSubscription.subscripedPackage = "none"
        aiachyState.user.aiachyInfo.version = version
        aiachyState.user.aiachyInfo.zodiacDataVersion = self.executiveServerManager.lastVersionZodiacData
    }
}

//MARK: SplashInteractor - SplashInteractorNetworkProtocol
extension SplashInteractor: SplashInteractorNetworkProtocol {
    /// Boolean value is returned as a result of network control.
    /// - Parameter completion: If true, found, if false, not found.
    func checkNetwork(completion: @escaping (Bool) -> ()) {
        networkMonitorManager.startEthernetCheck()
        cancellable = networkMonitorManager.isConnectedToEthernet
            .dropFirst()
            .sink(receiveValue: { [self] in
                guard $0 else { cancelNetwork(); isCheckedEnthernet = false; completion($0); return }
                self.isCheckedEnthernet = true
                completion($0)
            })
    }
    /// cancel networking
    func cancelNetwork() {
        networkMonitorManager.cancelEthernetConnection()
    }
}
