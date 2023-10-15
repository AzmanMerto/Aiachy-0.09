//
//  LoginView.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI
//MARK: LoginView - View
struct LoginView: View {
    
    @StateObject var presenter: LoginPresenter
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter) {
        self._presenter = StateObject(wrappedValue: LoginPresenter(aiachy: aiachyState,
                                                                   router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
        ZStack {
            Image(ImageHandler.makeAuthString(aiachyState, auth: .authLoginBackground))
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
// WillAdded:
/*
//MARK: LoginView - Previews
#Preview {
    LoginView(aiachy: ACY_PREVIEWS_STATE,
              router: AuthRouterPresenter())
}
 */
//MARK: LoginView - extension
extension LoginView {
    //MARK: LoginView - Guest Button
    private var guestButton: some View {
        HStack {
            Spacer()
            ACYPassButton(isItBackButton: false,
                          text: .guest) {
                router.navigate(to: .zodiacSelectionView)
                aiachyState.isGuest = true
            }
        }
        .padding(.horizontal)
        
    }
    //MARK: LoginView - Title & Description
    private var titleAndDescription: some View {
        ACYTitleAndDescriptionText(title: TextHandler.makeAuthString(aiachy: aiachyState,
                                                                     auth: .loginScreenTitle),
                                   description: TextHandler.makeAuthString(aiachy: aiachyState,
                                                                           auth: .loginScreenDescription))
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
                     textFieldTitle: .mailPhone)
        .keyboardType(.default)
        .padding(.bottom)
        //password textfield
        ACYTextField(textfieldString: $presenter.passwordTextField,
                     errorType: $presenter.passwordTextFieldErrorType,
                     isNeedPreferenceButton: false,
                     isHalfTextField: false,
                     isSecureField: true,
                     textFieldTitle: .password)
        .keyboardType(.default)
        .padding(.bottom,30)
    }
    //MARK: LoginView - loginButton
    private var loginButton: some View {
        ACYButton(text: .login) {
            presenter.checkForLogin(aiachy: aiachyState) {
                router.isUserComplateAuthCompletion = true
            }
        }
    }
    
    var registerButton: some View {
        VStack(spacing: 10) {
            Rectangle()
                .foregroundColor(.makeAiachyColor(aiachyState, aiachyColor: .firstColor))
                .frame(height: 1)
                .padding(.horizontal, ACYdw(aiachyState, d: 0.1))
            Button {
                router.navigate(to: .zodiacSelectionView)
            } label: {
                Text(TextHandler.makeGeneralButtonString(aiachy: aiachyState, button: .register))
                    .font(.aiachyFont(.cinzelBold12))
                    .foregroundColor(.makeAiachyColor(aiachyState, aiachyColor: .secondColor))
            }
            .makeAccessibilitysForUITest(identifier: "RegisterButtonID")
        }
    }
}
