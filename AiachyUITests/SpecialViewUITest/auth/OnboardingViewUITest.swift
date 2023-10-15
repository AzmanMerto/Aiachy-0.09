//
//  OnboardingViewUITest.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 10.08.2023.
//

import XCTest

final class OnboardingViewUITest: XCTestCase {
    
    let app = XCUIApplication()
    let aiachyUITest = AiachyUITests()
    let topElement: UITestNames = .onboardingViewID
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func test_OnboardingView_ACYOnboarding_isSkipToNextPage() throws {
        
        let loginViewID = app.otherElements["LoginViewID"]
        
        aiachyUITest.swipeOnboardingLeftAction()
        aiachyUITest.pressACYButton(topElements: topElement)
        
        XCTAssertTrue(loginViewID.exists)
    }
    
    func test_PrivacyPolicyView_PrivacyPolicyViewText_shouldTapToText() {
        
        let privacyPolicyButtonID = app.otherElements["PrivacyPolicyButtonID"]
        let privacyPolicyViewID = app.otherElements["PrivacyPolicyViewID"]
        
        privacyPolicyButtonID.tap()
        
        XCTAssertTrue(privacyPolicyViewID.exists)
    }
}

