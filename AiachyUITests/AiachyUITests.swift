//
//  AiachyUITests.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 14.05.2023.
//

import XCTest

final class AiachyUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func test_splashView_loadingProgress_isShowingOnboarding() {
        app.launch()
    }
    
    func testLaunchPerformance() throws {
        
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension AiachyUITests {
    func swipeOnboardingLeftAction() {
        let acyOnboardingID = app.otherElements["ACYOnboardingID"]
        for _ in 0..<2 {
            acyOnboardingID.swipeLeft()
        }
    }
    
    func chooseAZodiac(topElements: UITestNames ,zodiacSelection: ACYTextHelper.ACYZodiacText.ACYzodiacNameText ) {
        let SelectionTemplateID = app.otherElements[topElements.name].otherElements["\(zodiacSelection)SelectionTemplateID"].children(matching: .button).element
        SelectionTemplateID.tap()
    }
}
//MARK: AiachyUITest - extension - PressAnyThing
extension AiachyUITests {
    func pressACYButton(topElements: UITestNames) {
        let acyButtonID = app.otherElements[topElements.name].otherElements["ACYButtonID"].children(matching: .button).element
        acyButtonID.tap()
    }
    
    func pressACYPassButton(topElements: UITestNames) {
        let acyPassButtonID = app.otherElements[topElements.name].otherElements["ACYPassButtonID"].children(matching: .button).element
        acyPassButtonID.tap()
    }
    func pressAny(topElements: UITestNames, pressElement: String) {
        let pressAnyThing = app.otherElements[topElements.name].otherElements[pressElement].children(matching: .button).element
        pressAnyThing.tap()
    }
}

extension AiachyUITests {
    
    func getTextField(topElements: UITestNames, textFieldTitle: ACYTextHelper.ACYAppText.ACYappTextfieldText, isSecure: Bool? = nil) -> XCUIElement {
        let elementType: XCUIElement.ElementType = isSecure ?? false ? .secureTextField : .textField
        let identifier = isSecure ?? false ? "ACY\(textFieldTitle)TextFieldSecureID" : "ACY\(textFieldTitle)TextFieldNormalID"
        
        let textfield = app.otherElements[identifier].children(matching: elementType).element
        return textfield
    }
}

extension AiachyUITests {
    func skipOnboardingView() {
        swipeOnboardingLeftAction()
        pressACYButton(topElements: .onboardingViewID)
    }
}

extension AiachyUITests {
    func skipToAscendantSelection() {
        skipOnboardingView()
        pressAny(topElements: .loginViewID, pressElement: "RegisterButtonID")
        chooseAZodiac(topElements: .zodiacSelectionViewID, zodiacSelection: .AriesZodiac)
        pressACYButton(topElements: .zodiacSelectionViewID)
        let nameTextField = getTextField(topElements:.registerViewID, textFieldTitle: .NameTextField)
        let surnameTextField = getTextField(topElements:.registerViewID, textFieldTitle: .SurnameTextField)
        let mailTextField = getTextField(topElements:.registerViewID, textFieldTitle: .MailTextField)
        let passwordTextField = getTextField(topElements:.registerViewID, textFieldTitle: .PasswordTextField, isSecure: true)
        let againPasswordTextField = getTextField(topElements:.registerViewID, textFieldTitle: .AgainPasswordTextField, isSecure: true)
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
        pressACYButton(topElements: .registerViewID)
    }
    
    func checkhourAndMinutePickerMINUTEID(newValue: CGFloat) {
        let checkMinute = app.otherElements["checkhourAndMinutePickerMINUTEID"].children(matching: .picker).element
        
    }
    func checkhourAndMinutePickerHOURID() {
        
    }
}

