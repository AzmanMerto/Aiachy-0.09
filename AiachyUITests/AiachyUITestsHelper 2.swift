//
//  AiachyUITestsHelper.swift
//  AiachyUITests
//
//  Created by Mert Türedü on 11.08.2023.
//

import XCTest

enum TextFieldType {
    case normal
    case secure

    var elementType: XCUIElement.ElementType {
        switch self {
        case .normal:
            return .textField
        case .secure:
            return .secureTextField
        }
    }
}

enum UITestNames {
    case splashViewID
    case onboardingViewID
    case loginViewID
    case zodiacSelectionViewID
    case registerViewID
    case ascendantSelectionViewID
    case attentionViewID
    
    var name: String {
        switch self {
        case .splashViewID:
            return "SplashViewID"
        case .onboardingViewID:
            return "OnboardingViewID"
        case .loginViewID:
            return "LoginViewID"
        case .zodiacSelectionViewID:
            return "ZodiacSelectionViewID"
        case .registerViewID:
            return "RegisterViewID"
        case .ascendantSelectionViewID:
            return "AscendantSelectionViewID"
        case .attentionViewID:
            return "AttentionViewID"
        }
    }
}
