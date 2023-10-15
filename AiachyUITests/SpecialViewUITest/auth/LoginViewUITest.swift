//
//  LoginViewUITest.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 10.08.2023.
//

import XCTest

final class LoginViewUITest: XCTestCase {

    let app = XCUIApplication()
    let aiachyUITests = AiachyUITests()
    let topElement: UITestNames = .loginViewID
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        aiachyUITests.skipOnboardingView()
    }
    
    func test_LoginView_GuestButton_isSkipToGuest() {
        let zodiacSelectionViewID = app.otherElements["ZodiacSelectionViewID"]
        
        aiachyUITests.pressACYPassButton(topElements: topElement)

        XCTAssertTrue(zodiacSelectionViewID.exists)
    }
    
    func test_LoginView_TextFields_shouldFillTextFields() {
        let mailTextField = aiachyUITests.getTextField(topElements: topElement, textFieldTitle: .MailPhoneTextField)
        let passwordTextField = aiachyUITests.getTextField(topElements: topElement, textFieldTitle: .PasswordTextField, isSecure: true)
        
        mailTextField.tap()
        mailTextField.typeText("test@gmail.com")
        passwordTextField.tap()
        passwordTextField.typeText("1234567")

        XCTAssertEqual(mailTextField.value as! String, "test@gmail.com")
        XCTAssertEqual(passwordTextField.value as! String, "*******")
    }
    
    func test_LoginView_RegisterButton_isSkipToRegister() {
        let zodiacSelectionViewID = app.otherElements["ZodiacSelectionViewID"]
        
        aiachyUITests.pressAny(topElements: topElement, pressElement: "RegisterButtonID")
        
        XCTAssertTrue(zodiacSelectionViewID.exists)
    }
}

extension LoginViewUITest {
    
    func pressNormalTextField() {
        
    }
    
}
