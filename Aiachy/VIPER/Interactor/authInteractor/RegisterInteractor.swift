//
//  RegisterInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation
//MARK: RegisterInteractor - protocol - RegisterInteractorCheckProtocol
private protocol RegisterInteractorCheckProtocol {
    func checkMail(_ userEmail: String, completion: @escaping (Bool) -> ())
}
//MARK: RegisterInteractor - Interactor
class RegisterInteractor: ObservableObject {
    
    private let authServerManager: AuthServerManager
    
    init(authServerManager: AuthServerManager = AuthServerManager())
    {
        self.authServerManager = authServerManager
    }
    /// <#Description#>
    /// - Parameters:
    ///   - aiachyState: <#aiachyState description#>
    ///   - completion: <#completion description#>
    func checkUserInformation(userEmail: String, completion: @escaping (Bool) -> ()) {
        authServerManager.controlUserInformationOnServer(dataField: "userLoginInfo", whereField: "email", userInformation: userEmail) { checkedMail in
            if checkedMail {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
