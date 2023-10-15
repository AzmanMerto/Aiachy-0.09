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
    @State var textFieldTitle: TextHelper.TextFieldCompletion.textField
    @State var errorText: TextHelper.TextFieldCompletion.error?
    @State var preferenceText: TextHelper.TextFieldCompletion.textField?
    var preferenceAction: (() -> ())? = nil
    
    init(textfieldString: Binding<String>, 
         errorType: Binding<Int>,
         isShowingError: Bool = false,
         isNeedPreferenceButton: Bool = false,
         isHalfTextField: Bool = false,
         isSecureField: Bool = false,
         textFieldTitle: TextHelper.TextFieldCompletion.textField,
         errorText: TextHelper.TextFieldCompletion.error? = nil,
         preferenceText: TextHelper.TextFieldCompletion.textField? = nil,
         preferenceAction: ( () -> Void)? = nil) {
        self._textfieldString = textfieldString
        self._errorType = errorType
        self.isShowingError = isShowingError
        self.isNeedPreferenceButton = isNeedPreferenceButton
        self.isHalfTextField = isHalfTextField
        self.isSecureField = isSecureField
        self.textFieldTitle = textFieldTitle
        self.errorText = errorText
        self.preferenceText = preferenceText
        self.preferenceAction = preferenceAction
    }
    
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            //MARK: ACYTextField - Textfield
            isSecureTextFields
            .textFieldStyle(ACYTextFieldStyle(height: ACYdh(aiachyState, d: ACY_MIN_SIZE),
                                              text: TextHandler.makeTextFieldString(aiachy: aiachyState, textField: textFieldTitle)))
                .frame(height: ACYdh(aiachyState, d:  ACY_MIN_SIZE))
            //MARK: ACYTextField - Textfield Bottom error & button
            HStack {
                //error
                if isShowingError == true {
                    Text(TextHandler.maketextFieldErrorString(aiachy: aiachyState, textFieldError: errorText!))
                        .font(FontHandler.aiachyFont(.roundedMedium10))
                        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fourthColor)))
                }
                Spacer()
                //button
                if isNeedPreferenceButton == true && isHalfTextField == false {
                    Button {
                        preferenceAction!()
                    } label: {
                        Text(TextHandler.makeTextFieldString(aiachy: aiachyState,
                                                             textField: preferenceText!))
                            .font(FontHandler.aiachyFont(.roundedBlack8))
                    }
                }
            }
            .padding(.horizontal,5)
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)))
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
                         textFieldTitle: .mailPhone,
                         errorText: .emailWrong,
                         preferenceText: .resetPasswordPreference)
            ACYTextField(textfieldString: .constant("nomotetes.onetrue@gamil.com"),
                         errorType: .constant(0),
                         isShowingError: true,
                         isNeedPreferenceButton: true,
                         isHalfTextField: false,
                         isSecureField: true,
                         textFieldTitle: .mailPhone,
                         errorText: .emailWrong,
                         preferenceText: .resetPasswordPreference)
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
            errorText = .emailWrong
            isShowingError = true
        case 2:
            // passwordWrong
            errorText = .passwordWrong
            isShowingError = true
        case 3:
            // nameNotFillWrong
            errorText = .nameNotFill
            isShowingError = true
        case 4:
            // surnameNotFillWrong
            errorText = .surnameNotFill
            isShowingError = true
        case 5:
            // mailNotFillWrong
            errorText = .mailNotFill
            isShowingError = true
        case 6:
            // passwordNotFillWrong
            errorText = .passwordNotFill
            isShowingError = true
        case 7:
            // passwordAgainNotFillWrong
            errorText = .passwordAgainNotFill
            isShowingError = true
        case 8:
            // passwordNotSame
            errorText = .passwordNotSame
            isShowingError = true
        case 9:
            // mailCharacterWrong
            errorText = .mailCharactersWrong
            isShowingError = true
        case 10:
            // phoneCharacterWrong
            errorText = .phoneCharactersWrong
            isShowingError = true
        case 11:
            // passwordMinCharacterWrong
            errorText = .passwordMinCharacter
            isShowingError = true
        case 12:
            // mailCantFoundWrong
            errorText = .mailCantFound
            isShowingError = true
        case 13:
            // phoneCantFoundWrong
            errorText = .phoneCantFound
            isShowingError = true
        case 14:
            // passwordCantFoundWrong
            errorText = .passwordCantFound
            isShowingError = true
        case 15:
            // name min character
            errorText = .nameMinCharacter
            isShowingError = true
        case 16:
            // surname min character
            errorText = .surnameMinCharacter
            isShowingError = true
        case 17:
            // same mail on sever
            errorText = .mailUsedBefore
            isShowingError = true
        default:
            //Close error
            errorText = nil
            isShowingError = false
        }
    }
}
