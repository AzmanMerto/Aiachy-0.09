//
//  OnboardingViewTest.swift
//  AiachyTests
//
//  Created by Mert Türedü on 11.08.2023.
//

import XCTest
@testable import Aiachy

final class OnboardingViewTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_OnboardingPresenter_isCurrentUser_whenIsTrueIsHaveProblem() throws {
        let userCurrentUser: Bool = true
        
        let presenter = SplashPresenter(isCurrentUser: userCurrentUser)
        
        XCTAssertTrue(presenter.isCurrentUser)
    }

}
