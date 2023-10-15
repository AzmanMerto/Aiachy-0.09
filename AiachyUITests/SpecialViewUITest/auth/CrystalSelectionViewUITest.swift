//
//  CrystalSelectionViewUITest.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 10.08.2023.
//

import XCTest
//NextPatchTODO: Refactor this place
final class CrystalSelectionViewUITest: XCTestCase {

    let app = XCUIApplication()
    let aiachyUITests = AiachyUITests()
    let topElement: UITestNames = .zodiacSelectionViewID
    let selectedZodiac: ACYTextHelper.ACYZodiacText.ACYzodiacNameText = .AquariusZodiac
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        aiachyUITests.skipOnboardingView()
        aiachyUITests.pressAny(topElements: topElement, pressElement: "RegisterButtonID")
    }
    func test_ZodiacSelectionView_ZodiacSelectTemplate_isCanSelectedZodiac() {
        aiachyUITests.chooseAZodiac(topElements: .zodiacSelectionViewID, zodiacSelection: selectedZodiac)
    }
    
    func test_ZodiacSelectionView_ZodiacSelectTemplate_isSkipToRegisterView() {
        let registerViewID = app.otherElements["RegisterViewID"]
        
        aiachyUITests.chooseAZodiac(topElements: topElement, zodiacSelection: selectedZodiac)
        aiachyUITests.pressACYButton(topElements: topElement)
        
        XCTAssertTrue(registerViewID.exists)
    }
}
