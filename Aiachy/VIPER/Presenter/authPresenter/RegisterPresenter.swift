//
//  RegisterPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

//MARK: AscendantSelectionPresenter - procotol  - RegisterPresenterAiachyStateProtocol
private protocol RegisterPresenterAiachyStateProtocol {
    func checkValues(aiachy aiachyState: AiachyState, completion: @escaping () -> ())
    func uploadValuesToState(aiachyState: AiachyState)
    func updateValuesFromState(aiachyState: AiachyState)
}
//MARK: AscendantSelectionPresenter - Presenter
class RegisterPresenter: ObservableObject {
    
    @Published var userName: String
    @Published var userSurname: String
    @Published var userMail: String
    @Published var userPassword: String
    @Published var userPasswordAgain: String
    
    @Published var userNameErrorType: Int
    @Published var userSurnameErrorType: Int
    @Published var userMailErrorType: Int
    @Published var userPasswordErrorType: Int
    @Published var userPasswordAgainErrorType: Int
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    let interactor: RegisterInteractor
    
    init(userNameErrorType: Int = 0,
         userSurnameErrorType: Int = 0,
         userMailErrorType: Int = 0,
         userPasswordErrorType: Int = 0,
         userPasswordAgainErrorType: Int = 0,
         userName: String = "",
         userSurname: String = "",
         userMail: String = "" ,
         userPassword: String = "" ,
         userPasswordAgain: String = "",
         aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter,
         interactor: RegisterInteractor = RegisterInteractor()) {
        self.userNameErrorType = userNameErrorType
        self.userSurnameErrorType = userSurnameErrorType
        self.userMailErrorType = userMailErrorType
        self.userPasswordErrorType = userPasswordErrorType
        self.userPasswordAgainErrorType = userPasswordAgainErrorType
        self.userName = userName
        self.userSurname = userSurname
        self.userMail = userMail
        self.userPassword = userPassword
        self.userPasswordAgain = userPasswordAgain
        self.aiachyState = aiachyState
        self.router = router
        self.interactor = interactor
    }
}
//MARK: AscendantSelectionPresenter - extension - RegisterPresenterAiachyStateProtocol
extension RegisterPresenter: RegisterPresenterAiachyStateProtocol {
    /// we are checking values is it true or false if false error type triggering else nothing else
    /// - Parameter completion: when all cheking values complate that
    func checkValues(aiachy aiachyState: AiachyState, completion: @escaping () -> ()) {
        
        let name = userName
        let surname = userSurname
        let mail = userMail
        let password = userPassword
        let passwordAgain = userPasswordAgain
        
        guard name != "" else {
            userNameErrorType = 3
            return
        }
        guard name.count > 1 else {
            userNameErrorType = 15
            return
        }
        guard surname != "" else {
            userSurnameErrorType = 4
            return
        }
        guard surname.count > 1 else {
            userSurnameErrorType = 16
            return
        }
        guard mail != "" else {
            userMailErrorType = 5
            return
        }
        guard mail.isValidEmail() else {
            userMailErrorType = 9
            return
        }
        guard password != "" else {
            userPasswordErrorType = 6
            return
        }
        guard password.count > 6 else {
            userPasswordErrorType = 11
            return
        }
        guard passwordAgain != "" else {
            userPasswordAgainErrorType = 7
            return
        }
        guard password == passwordAgain else {
            userPasswordAgainErrorType = 8
            return
        }
        interactor.checkUserInformation(userEmail: mail) { [self] checkedMail in
            if checkedMail {
                userMailErrorType = 17
            } else {
                completion()
                uploadValuesToState(aiachyState: aiachyState)
            }
        }
    }
    /// Here we load all the values on the page aiachyState
    /// - Parameter aiachyState: thats for upload values
    func uploadValuesToState(aiachyState: AiachyState){
        aiachyState.user.userInfo.fullName.firstName = userName
        aiachyState.user.userInfo.fullName.lastName = userSurname
        aiachyState.user.userLoginInfo.email = userMail
        aiachyState.user.userLoginInfo.password = userPassword
    }
    /// If values have already been given, we reflect them to the values on the page
    /// - Parameter aiachyState: We get the stored values
    func updateValuesFromState(aiachyState: AiachyState) {
        self.userName = aiachyState.user.userInfo.fullName.firstName ?? ""
        self.userSurname = aiachyState.user.userInfo.fullName.lastName ?? ""
        self.userMail = aiachyState.user.userLoginInfo.email ?? ""
        self.userPassword = aiachyState.user.userLoginInfo.password ?? ""
        self.userPasswordAgain = aiachyState.user.userLoginInfo.password ?? ""
    }
}
