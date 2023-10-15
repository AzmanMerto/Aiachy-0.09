//
//  ACYTextField.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.07.2023.
//

import SwiftUI
//NeedRefator: its like bull shitt refactor needed
struct ACYTextField: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var textfieldString: String
    @Binding var errorType: Int
    @State var isShowingError: Bool = false
    @State var isNeedPreferenceButton: Bool = false
    @State var isHalfTextField: Bool = false
    @State var isSecureField: Bool = false
    @State var textFieldTitle: ACYTextHelper.ACYAppText.ACYappTextfieldText
    @State var errorText: ACYTextHelper.ACYAppText.ACYappTextfieldErrorText?
    @State var preferenceText: String? = nil
    var preferenceAction: (() -> ())? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            //MARK: ACYTextField - Textfield
            isSecureTextFields
            .textFieldStyle(ACYTextFieldStyle(height: ACYdh(aiachyState, d: ACY_MIN_SIZE),
                                              text: textFieldTitle.rawValue))
                .frame(height: ACYdh(aiachyState, d:  ACY_MIN_SIZE))
            //MARK: ACYTextField - Textfield Bottom error & button
            HStack {
                //error
                if isShowingError == true {
                    Text(errorText!.rawValue.locale())
                        .font(.aiachyFont(.roundedMedium10))
                        .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .fourthColor))
                }
                Spacer()
                //button
                if isNeedPreferenceButton == true && isHalfTextField == false {
                    Button {
                        preferenceAction!()
                    } label: {
                        Text(preferenceText!.locale())
                            .font(.aiachyFont(.roundedBlack8))
                    }
                }
            }
            .padding(.horizontal,5)
            .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .firstColor))
        }
        .frame(width: ACYdw(aiachyState, d: isHalfTextField ? 0.4 : 0.9 ))
        .onChange(of: errorType) { type in
            checkErrorType(type: type)
        }
        .onChange(of: textfieldString) { _ in
            errorType = 0
        }
    }
}

struct ACYTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(content: {
            ACYTextField(textfieldString: .constant("nomotetes.onetrue@gamil.com"),
                         errorType: .constant(0),
                         isShowingError: true,
                         isNeedPreferenceButton: true,
                         isHalfTextField: false,
                         isSecureField: false,
                         textFieldTitle: .MailPhoneTextField,
                         errorText: .EmailWrong,
                         preferenceText: "preference button") { print("preference button working ") }
            ACYTextField(textfieldString: .constant("nomotetes.onetrue@gamil.com"),
                         errorType: .constant(0),
                         isShowingError: true,
                         isNeedPreferenceButton: true,
                         isHalfTextField: false,
                         isSecureField: true,
                         textFieldTitle: .MailPhoneTextField,
                         errorText: .EmailWrong,
                         preferenceText: "preference button") { print("preference button working ") }
        })
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}

extension ACYTextField {
    
    @ViewBuilder
    var isSecureTextFields: some View {
        if isSecureField {
            SecureField("", text: $textfieldString)
                .autocorrectionDisabled(true)
                .textContentType(.oneTimeCode)
                .makeAccessibilitysForUITest(identifier: "ACY\(textFieldTitle)TextFieldSecureID")
        } else {
            TextField("", text: $textfieldString)
                .autocorrectionDisabled(true)
                .textContentType(.none)
                .makeAccessibilitysForUITest(identifier: "ACY\(textFieldTitle)TextFieldNormalID")
        }
    }
    
    /// It is a formation that will show the error messages that we have set before on the view screen.
    /// - Parameter type: Incoming number according to error type
    private func checkErrorType(type: Int) {
        switch type {
        case 0:
            //Close error
            errorText = .none
            isShowingError = false
        case 1:
            // email wrong
            errorText = .EmailWrong
            isShowingError = true
        case 2:
            // passwordWrong
            errorText = .PasswordWrong
            isShowingError = true
        case 3:
            // nameNotFillWrong
            errorText = .NameNotFillWrong
            isShowingError = true
        case 4:
            // surnameNotFillWrong
            errorText = .SurnameNotFillWrong
            isShowingError = true
        case 5:
            // mailNotFillWrong
            errorText = .MailNotFillWrong
            isShowingError = true
        case 6:
            // passwordNotFillWrong
            errorText = .PasswordNotFillWrong
            isShowingError = true
        case 7:
            // passwordAgainNotFillWrong
            errorText = .PasswordAgainNotFillWrong
            isShowingError = true
        case 8:
            // passwordNotSame
            errorText = .PasswordNotSame
            isShowingError = true
        case 9:
            // mailCharacterWrong
            errorText = .MailCharactersWrong
            isShowingError = true
        case 10:
            // phoneCharacterWrong
            errorText = .PhoneCharactersWrong
            isShowingError = true
        case 11:
            // passwordMinCharacterWrong
            errorText = .PasswordMinCharacterWrong
            isShowingError = true
        case 12:
            // mailCantFoundWrong
            errorText = .MailCantFoundWrong
            isShowingError = true
        case 13:
            // phoneCantFoundWrong
            errorText = .PhoneCantFoundWrong
            isShowingError = true
        case 14:
            // passwordCantFoundWrong
            errorText = .PasswordCantFoundWrong
            isShowingError = true
        case 15:
            // name min character
            errorText = .NameMinCharacterWrong
            isShowingError = true
        case 16:
            // surname min character
            errorText = .SurnameMinCharacterWrong
            isShowingError = true
        case 17:
            // same mail on sever
            errorText = .MailUsedBefore
            isShowingError = true
        default:
            //Close error
            errorText = .none
            isShowingError = false
        }
    }
}
