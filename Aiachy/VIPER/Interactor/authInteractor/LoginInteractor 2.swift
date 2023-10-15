//
//  LoginInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.05.2023.
//

import Foundation
import Combine
// MARL: LoginInteractor - protocol - LoginInteractorSetterProtocol
private protocol LoginInteractorSetterProtocol {
    
}
// MARL: LoginInteractor - Interactor
class LoginInteractor: ObservableObject {
    
    let authServerManager: AuthServerManager
    
    init(authServerManager: AuthServerManager = AuthServerManager()) {
        self.authServerManager = authServerManager
    }
    /// Checking email
    /// - Parameters:
    ///   - aiachyState: aiachy user local data.
    ///   - email: email for seracing user.
    ///   - password: password for verfication user.
    ///   - completion: if its true yes that user else error
    func controlMailFromServer(aiachy aiachyState: AiachyState, email: String, password: String, completion: @escaping (Bool) -> ()) {
        /// User Login Info
        let userLoginInfo = UserLoginInfo(email: email, password: password)
        /// Check Login user email
        authServerManager.checkLoginWithEmail(userLogin: userLoginInfo) { [self] result in
            switch result {
            case .success(let success):
                aiachyState.user = success
                setterCompletion(user: success)
                completion(true)
            case .failure(let failure):
                print(failure.printDataFetching("LoginInteractor"))
                completion(false)
            }
        }
    }
}


extension LoginInteractor: LoginInteractorSetterProtocol {
    
    fileprivate func setterCompletion(user: User) {
        setIdFromServer(user: user)
    }
    
    fileprivate func setIdFromServer(user: User ) {
        let userIDfromServer = user.userInfo.id
        ACYUserDefaults.set(userIDfromServer, forKey: ACYUserID)
    }
}
