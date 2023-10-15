//
//  AttentionInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
import Combine
//MARK: AttentionInteractor - protocol - AttentionInteractorMakeProtocol
private protocol AttentionInteractorMakeProtocol {
    func makeId(aiachy aiachyState: AiachyState)
}
//MARK: AttentionInteracto - protocol - AttentionInteractorNetworkProtocol
private protocol AttentionInteractorNetworkProtocol {
    func checkNetwork(completion: @escaping (Bool) -> ())
}
//MARK: AttentionInteractor - View
class AttentionInteractor: ObservableObject {
    
    private let networkMonitorManager: NetworkMonitorManager
    private let authServerManager: AuthServerManager
    private var cancellable: AnyCancellable?
    
    init(networkMonitorManager: NetworkMonitorManager = NetworkMonitorManager(),
         authServerManager: AuthServerManager = AuthServerManager())
    {
        self.networkMonitorManager = networkMonitorManager
        self.authServerManager = authServerManager
    }
    /// User action is taken after checking the internet.
    /// - Parameters:
    ///   - aiachyState: to get user data.
    ///   - completion: If there is internet, the user creates it, if not, it does not.
    func makeUser(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ()) {
        checkNetwork { [self] in
            guard $0 else { return completion(false) }
            makeId(aiachy: aiachyState)
            let createdUserData = aiachyState.user
            authServerManager.createUser(user: createdUserData)
            completion(true)
        }
    }
}
//MARK: AttentionInteractor - extension - AttentionInteractorMakeProtocol
extension AttentionInteractor: AttentionInteractorMakeProtocol {
    /// To create a custom id.
    /// - Parameter aiachyState: id should shape where to set.
    func makeId(aiachy aiachyState: AiachyState) {
        aiachyState.user.userInfo.id = UUID().uuidString
        ACYUserDefaults.setValue(aiachyState.user.userInfo.id, forKey: ACYUserID)
    }
}
//MARK: AttentionInteractor - extension  AttentionInteractorNetworkProtocol
extension AttentionInteractor: AttentionInteractorNetworkProtocol {
    /// Boolean value is returned as a result of network control.
    /// - Parameter completion: If true, found, if false, not found.
    fileprivate func checkNetwork(completion: @escaping (Bool) -> ()) {
        networkMonitorManager.startEthernetCheck()
        cancellable = networkMonitorManager.isConnectedToEthernet
            .dropFirst()
            .sink(receiveValue: { completion($0) })
    }
}
