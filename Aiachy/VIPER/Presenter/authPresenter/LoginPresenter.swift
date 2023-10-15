//
//  LoginPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI

class LoginPresenter: ObservableObject {

    
    
    @Published var isUserCanEntryApp: Bool
    @Published var isNetworkingChecked: Bool
    @Published var mailPhoneTextFieldErrorType: Int
    @Published var passwordTextFieldErrorType: Int
    @Published var mailPhoneTextField: String
    @Published var passwordTextField: String
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    let interactor: LoginInteractor
    
    init(isUserCanEntryApp: Bool = false,
         isNetworkingChecked: Bool = false,
         mailPhoneTextFieldErrorType: Int = 0,
         passwordTextFieldErrorType: Int = 0,
         mailPhoneTextField: String = "",
         passwordTextField: String = "",
         aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter,
         interactor: LoginInteractor = LoginInteractor()) {
        self.isUserCanEntryApp = isUserCanEntryApp
        self.isNetworkingChecked = isNetworkingChecked
        self.mailPhoneTextFieldErrorType = mailPhoneTextFieldErrorType
        self.passwordTextFieldErrorType = passwordTextFieldErrorType
        self.mailPhoneTextField = mailPhoneTextField
        self.passwordTextField = passwordTextField
        self.aiachyState = aiachyState
        self.router = router
        self.interactor = interactor
    }
    
    /// Here, when the user makes any mistake when logging in to the textfield fields, it shows an error message. If there is none, the user logs in.
    func checkForLogin(aiachy aiachyState: AiachyState,completion: @escaping () -> ()) {
        
        let mailPhoneText = self.mailPhoneTextField
        let passwordText = self.passwordTextField
        
        guard mailPhoneText != "" else {
            self.mailPhoneTextFieldErrorType = 5
            return
        }

        guard passwordText != "" else {
            self.passwordTextFieldErrorType = 6
            return
        }

        guard mailPhoneText.isValidEmail() else {
            self.mailPhoneTextFieldErrorType = 9
            return
        }

        guard passwordText.count > 5 else {
            self.passwordTextFieldErrorType = 11
            return
        }
        
        interactor.controlMailFromServer(aiachy: aiachyState, email: mailPhoneText, password: passwordText) { isItHaveUser in
            if isItHaveUser {
                completion()
            }
        }
    }
}
