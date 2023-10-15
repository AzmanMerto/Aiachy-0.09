//
//  RegisterView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
//MARK: RegisterView - View
struct RegisterView: View {
    
    @StateObject var presenter: RegisterPresenter
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter) {
        self._presenter = StateObject(wrappedValue: RegisterPresenter(aiachy: aiachyState,
                                                                      router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
            
            VStack {
                //MARK: RegisterView - Back Button
                HStack {
                    ACYPassButton(isItBackButton: true,
                                  text: .back) {
                        router.navigate(to: .zodiacSelectionView)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                //MARK: RegisterView - Tittle & Description
                ACYTitleAndDescriptionText(title: TextHandler.makeAuthString(aiachy: aiachyState,
                                                                             auth: .registerTitle),
                                           description: TextHandler.makeAuthString(aiachy: aiachyState,
                                                                                   auth: .registerDescription))
                //MARK: RegisterView - Name & Surname Textfields
                namesTextFields
                //MARK: RegisterView - Mail Textfield
                mailTextField
                //MARK: RegisterView - Password & Password Again Textfields
                passwordTextFields
                Spacer()
                //MARK: RegisterView - Continue Button
                continueButton
            }
            .background { backgroundZodiacImage }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "RegisterViewID")
    }
}
// WillAdded:
/*
//MARK: RegisterView -  Previews
#Preview("RegisterView") {
    RegisterView(aiachy: ACY_PREVIEWS_STATE,
                 router: AuthRouterPresenter())
}
 */
//MARK: RegisterView - Extension
extension RegisterView {
    //MARK: RegisterView - Name & Surname Textfields
    private var namesTextFields: some View {
        HStack {
            ACYTextField(textfieldString: $presenter.userName,
                         errorType: $presenter.userNameErrorType,
                         isNeedPreferenceButton: false,
                         isHalfTextField: true ,
                         isSecureField: false,
                         textFieldTitle: .name )
            Spacer()
            ACYTextField(textfieldString: $presenter.userSurname,
                         errorType: $presenter.userSurnameErrorType,
                         isNeedPreferenceButton: false,
                         isHalfTextField: true ,
                         isSecureField: false,
                         textFieldTitle: .surname )
        }
        .frame(width: ACYdw(aiachyState, d: 0.9))
    }
    //MARK: RegisterView - Mail Textfield
    private var mailTextField: some View {
        ACYTextField(textfieldString: $presenter.userMail,
                     errorType: $presenter.userMailErrorType,
                     isNeedPreferenceButton: false,
                     isHalfTextField: false,
                     isSecureField: false,
                     textFieldTitle: .mail)
        .keyboardType(.emailAddress)
    }
    //MARK: RegisterView - Password & Password Again Textfields
    private var passwordTextFields: some View {
        HStack {
            ACYTextField(textfieldString: $presenter.userPassword,
                         errorType: $presenter.userPasswordErrorType,
                         isNeedPreferenceButton: false,
                         isHalfTextField: true ,
                         isSecureField: true,
                         textFieldTitle: .password )
            Spacer()
            ACYTextField(textfieldString: $presenter.userPasswordAgain,
                         errorType: $presenter.userPasswordAgainErrorType,
                         isNeedPreferenceButton: false,
                         isHalfTextField: true ,
                         isSecureField: true,
                         textFieldTitle: .againPassword )
        }
        .frame(width: ACYdw(aiachyState, d: 0.9))
    }

    //MARK: RegisterView - Continue Button
    private var continueButton: some View {
        ACYButton(text: .continue) {
            presenter.checkValues(aiachy: aiachyState) {
                router.navigate(to: .ascendantSelectionView)
            }
        }
    }
    
    
    private var backgroundZodiacImage: some View {
        makeImageWithZodiacInt(aiachy: aiachyState,zodiac: aiachyState.user.userZodiac.wrappedZodiac)
            .resizable()
            .scaledToFit()
            .opacity(0.2)
            .padding(.all,55)
    }
}
