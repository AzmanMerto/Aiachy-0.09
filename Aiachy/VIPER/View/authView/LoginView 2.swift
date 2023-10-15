//
//  LoginView.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI
//MARK: LoginView - View
struct LoginView: View {
    
    @EnvironmentObject var aiachyState : AiachyState
    @ObservedObject var presenter = LoginPresenter()
    let router: AuthRouterPresenter
    @State var textfieldio = ""
    var body: some View {
        ZStack {
            Image.setACYBackgroundImage(aiachyState, background: .authLoginBackground)
                .resizable()
                .scaledToFit()
                .opacity(0.2)
                .padding(.all,15)
                .padding(.top,50)
            VStack {
                //MARK: LoginView - Guest Button
                guestButton
                //MARK: LoginView - Title & Description
                titleAndDescription
                Spacer()
                //MARK: LoginView - Textfields
                textfields
                //MARK: LoginView - LoginButton
                loginButton
                Spacer()
                //MARK: LoginView - RegisterButton
                registerButton
            }
        }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "LoginViewID")
    }
}
//MARK: LoginView - Previews
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AuthBackground()
            LoginView(router: AuthRouterPresenter())
        }
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}
//MARK: LoginView - extension
extension LoginView {
    //MARK: LoginView - Guest Button
    private var guestButton: some View {
        HStack {
            Spacer()
            ACYPassButton(isItBackButton: false,
                          text: ACYTextHelper.ACYAppText.ACYappButtonText.GuestButton.rawValue) {
                router.navigate(to: .zodiacSelectionView)
                aiachyState.isGuest = true
            }
        }
        .padding(.horizontal)
        
    }
    //MARK: LoginView - Title & Description
    private var titleAndDescription: some View {
        ACYTitleAndDescriptionText(titleText: ACYTextHelper.ACYAuthText.ACYauthTitleText.LoginScreenViewTitle.rawValue,
                                   descriptionText: ACYTextHelper.ACYAuthText.ACYauthDescriptionText.LoginScreenViewDescription.rawValue)
    }
    
    //MARK: LoginView - textfields
    @ViewBuilder
    private var textfields: some View {
        //mail textfield
        ACYTextField(textfieldString: $presenter.mailPhoneTextField,
                     errorType: $presenter.mailPhoneTextFieldErrorType,
                     isNeedPreferenceButton: false,
                     isHalfTextField: false,
                     isSecureField: false,
                     textFieldTitle: .MailPhoneTextField)
        .keyboardType(.default)
        .padding(.bottom)
        //password textfield
        ACYTextField(textfieldString: $presenter.passwordTextField,
                     errorType: $presenter.passwordTextFieldErrorType,
                     isNeedPreferenceButton: false,
                     isHalfTextField: false,
                     isSecureField: true,
                     textFieldTitle: .PasswordTextField)
        .keyboardType(.default)
        .padding(.bottom,30)
    }
    //MARK: LoginView - loginButton
    private var loginButton: some View {
        ACYButton(text: ACYTextHelper.ACYAppText.ACYappButtonText.LoginButton.rawValue) {
            presenter.checkForLogin(aiachy: aiachyState) {
                router.isUserComplateAuthCompletion = true
            }
        }
    }
    
    var registerButton: some View {
        VStack(spacing: 10) {
            Rectangle()
                .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .firstColor))
                .frame(height: 1)
                .padding(.horizontal, ACYdw(aiachyState, d: 0.1))
            Button {
                router.navigate(to: .zodiacSelectionView)
            } label: {
                Text(ACYTextHelper.ACYAppText.ACYappButtonText.RegisterButton.rawValue.locale())
                    .font(.aiachyFont(.cinzelBold12))
                    .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .secondColor))
            }
            .makeAccessibilitysForUITest(identifier: "RegisterButtonID")
        }
    }
}
