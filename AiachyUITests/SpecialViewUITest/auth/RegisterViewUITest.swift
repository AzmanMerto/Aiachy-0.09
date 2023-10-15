//
//  RegisterViewUITest.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 10.08.2023.
//

import XCTest

final class RegisterViewUITest: XCTestCase {

    let app = XCUIApplication()
    let aiachyUITests = AiachyUITests()
    let topElement: UITestNames = .registerViewID
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        aiachyUITests.skipOnboardingView()
        aiachyUITests.pressAny(topElements: .loginViewID, pressElement: "RegisterButtonID")
        aiachyUITests.chooseAZodiac(topElements: .zodiacSelectionViewID, zodiacSelection: .AriesZodiac)
        aiachyUITests.pressACYButton(topElements: .zodiacSelectionViewID)
    }
    
    func test_RegisterViewUITest_TextFields_isFillAllTextfields() {
        
        let nameTextField = aiachyUITests.getTextField(topElements: topElement, textFieldTitle: .NameTextField)
        let surnameTextField = aiachyUITests.getTextField(topElements: topElement, textFieldTitle: .SurnameTextField)
        let mailTextField = aiachyUITests.getTextField(topElements: topElement, textFieldTitle: .MailTextField)
        let passwordTextField = aiachyUITests.getTextField(topElements: topElement, textFieldTitle: .PasswordTextField, isSecure: true)
        let againPasswordTextField = aiachyUITests.getTextField(topElements: topElement, textFieldTitle: .AgainPasswordTextField, isSecure: true)
        let ascendantSelection = app.otherElements["AscendantSelectionViewID"]
        
        nameTextField.tap()
        nameTextField.typeText("Mert")

        surnameTextField.tap()
        surnameTextField.typeText("Türedü")
        
        mailTextField.tap()
        mailTextField.typeText("nomotetes.onetrue@icloud.com")
        
        passwordTextField.tap()
        passwordTextField.typeText("1234567")
        
        againPasswordTextField.tap()
        againPasswordTextField.typeText("1234567")
        
        aiachyUITests.pressACYButton(topElements: topElement)
        
        XCTAssertTrue(ascendantSelection.exists)
    }
    
}
