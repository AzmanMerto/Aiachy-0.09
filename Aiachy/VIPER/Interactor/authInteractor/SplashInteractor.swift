
//  SplashInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI
import Combine
//MARK: SplashInteractor -  protocol - HandlerProtocol
private protocol HandlerProtocol {
    func checkNetwork(completion: @escaping (Bool) -> ())
    func setUserNew(aiachy aiachyState: AiachyState)
    func cancelNetwork()
}
//MARK: SplashInteractor -  protocol - ServerProtocol
private protocol ServerProtocol {
    func checkZodiacDataVersion(aiachy aiachyState: AiachyState,completion: @escaping (Bool) -> ())
}
//MARK: SplashInteractor -  protocol - CoreDataProtocol
private protocol CoreDataProtocol {
    func setServerZodiacDataToCoreData()
    func deleteAllZodiacCoreDatas()
}
private protocol StoreProtocol {
    func fetchProducts(aiachy aiachyState: AiachyState)
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
    private let storeKitManager: StoreKitManager
    private var cancellable: AnyCancellable?
    
    init(isHaveError: Int = 5,
         authServerManager: AuthServerManager = AuthServerManager(),
         zodiacServerManager: ZodiacServerManager = ZodiacServerManager(),
         executiveServerManager: ExecutiveServerManager = ExecutiveServerManager(),
         coreDataManager: CoreDataManager = CoreDataManager(),
         networkMonitorManager: NetworkMonitorManager = NetworkMonitorManager(),
         storeKitManager: StoreKitManager = StoreKitManager())
    {
        //NextPatchTODO: Will change 
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
        self.storeKitManager = storeKitManager
    }
    /// Controlling interactor process.
    /// - Parameters:
    ///   - aiachyState: if user fetched datas from server it will be setted value.
    ///   - completion: if false its turning handeledError on presenter page else its login successfull
    func controlUser(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ()) {
        /// checking
        guard self.isCheckedEnthernet ?? false else { self.isHaveError.send(0); completion(false); return }
        /// check nethowrk or error
        fetchUser(aiachy: aiachyState) { [self] isFetchedUser in
            /// checking user
            if isFetchedUser {
                checkZodiacDataVersion(aiachy: aiachyState) {
                    guard $0 else {self.setServerZodiacDataToCoreData(); completion(true); return }
                    
                    self.checkCoreData {
                        guard $0 else {self.setServerZodiacDataToCoreData(); completion(true); return }
                        completion(true)
                    }
                }
            } else {
                /// setted core data
                self.setServerZodiacDataToCoreData()
                self.setUserNew(aiachy: aiachyState)
                isHaveError.send(3)
                completion(false)
            }
        }
    }
}
//MARK: SplashInteractor -  extension - HandlerProtocol
extension SplashInteractor: HandlerProtocol {
    /// To set the user's unset data
    /// - Parameter aiachyState: state where values will change
    fileprivate func setUserNew(aiachy aiachyState: AiachyState) {
        /// bundle
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        /// setting value
        aiachyState.user.userOracle.isOracled = false
        aiachyState.user.userOracle.oracleMethod = ""
        aiachyState.user.userOracle.oraclePackage = "none"
        aiachyState.user.userOracle.aicyCash = 0
        aiachyState.user.aiachyInfo.version = version
        executiveServerManager.setLocalUserZodiacDataVersion(aiachy: aiachyState)
    }
    
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

//MARK: SplashInteractor -  extension - ServerProtocol
extension SplashInteractor: ServerProtocol {
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
    fileprivate func checkZodiacDataVersion(aiachy aiachyState: AiachyState,completion: @escaping (Bool) -> ()) {

        executiveServerManager.checkIsSameZodiacVersion(aiachy: aiachyState) { [self] isSameZodiacVersion in
            if isSameZodiacVersion {
                completion(isSameZodiacVersion)
            } else {
                executiveServerManager.updateServerUserZodiacDataVersion(aiachy: aiachyState)
                executiveServerManager.setLocalUserZodiacDataVersion(aiachy: aiachyState)
                completion(isSameZodiacVersion)
            }
        }
    }
}
//MARK: SplashInteractor -  protocol - CoreDataProtocol
extension SplashInteractor: CoreDataProtocol {
    /// Setting core data
    /// - Parameter completion: if turn true current updateing
    fileprivate func setServerZodiacDataToCoreData() {
        deleteAllZodiacCoreDatas()
        zodiacServerManager.getUserZodiacEntityFromServer { data in
            self.coreDataManager.saveUserAllEntity(entity: data)
        }
    }
    
    fileprivate func checkCoreData(completion: @escaping (Bool) -> ()) {
        let checekedCoreData = coreDataManager.checkDataExists(type: .zodiacEntity)
        completion(checekedCoreData)
    }
    
    fileprivate func deleteAllZodiacCoreDatas() {
        coreDataManager.deleteAllData(type: .ascendiantEntity)
        coreDataManager.deleteAllData(type: .compatibilityEntity)
        coreDataManager.deleteAllData(type: .zodiacEntity)
        coreDataManager.deleteAllData(type: .chakraStatusEntity)
    }
    
}

extension SplashInteractor: StoreProtocol {
    func fetchProducts(aiachy aiachyState: AiachyState) {
            storeKitManager.requestProducts()
    }
}

