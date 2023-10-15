//
//  SplashViewUITest.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 10.08.2023.
//

import XCTest

final class SplashViewUITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func test_SplashView_ACYLoadingProgress_isSkiping() {
        let onboardingView = self.app.otherElements["OnboardingViewID"]
        let isSeenOnboardingView = onboardingView.waitForExistence(timeout: 1)
        XCTAssertTrue(isSeenOnboardingView)
    }
    
    func test_SplashView_ACYAlertView_isNotShowing() {
        let acyAlertView = app.otherElements["ACYAlertViewID"]
        let isSeenACYAlertView = acyAlertView.waitForExistence(timeout: 1)
        XCTAssertFalse(isSeenACYAlertView)
    }
    
}
