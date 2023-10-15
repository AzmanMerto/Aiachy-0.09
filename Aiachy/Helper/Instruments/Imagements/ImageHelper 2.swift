//
//  ImageHelper.swift
//  Aiachy
//
//  Created by Mert Türedü on 14.05.2023.
//

import Foundation

struct ImageHelper {
    
    enum aiachyThemeImage {
        case AiachyLight
        case AiachyDark
    }
    
    struct ACYAppImage {
        enum ACYappImage: String {
            case appLogo = "appLogo"
        }
        
        enum ACYalertImage: String {
            case notUserHaveConnection = "notUserHaveConnection"
            case notAscendantSelection = "authAscendantSelectionBackground"
        }
        
        enum ACYonboardingImage: String {
            case authHeart = "authHeart"
            case secretStar = "authSecretStar"
            case yourFuture = "authYourFuture"
        }
        
        enum button: String {
            case rightArrowButton = "rightArrowButton"
            case leftArrowButton = "leftArrowButton"
        }
        
        enum background: String {
            case authBackgroundSymbol1 = "authBackgroundSymbol1"
            case authBackgroundSymbol2 = "authBackgroundSymbol2"
            case authLoginBackground = "authLoginBackground"
            case authAscendantSelectionBackground = "authAscendantSelectionBackground"
            case privacyTermsBackground = "privacyTermsBackground"
        }
    }
    
    struct ZodiacCompletion {
        enum ACYzodiacImage: String {
            case aquarius = "Aquarius"
            case aries = "Aries"
            case cancer = "Cancer"
            case capricorn = "Capricorn"
            case gemini = "Gemini"
            case leo = "Leo"
            case libra = "Libra"
            case pisces = "Pisces"
            case sagittarius = "Sagittarius"
            case scorpion = "Scorpion"
            case taurus = "Taurus"
            case virgo = "Virgo"
        }
        
        enum zodiacAlt: String {
            case altAquarius = "AquariusAlternative"
            case altAries = "AriesAlternative"
            case altCancer = "CancerAlternative"
            case altCapricorn = "CapricornAlternative"
            case altGemini = "GeminiAlternative"
            case altLeo = "LeoAlternative"
            case altLibra = "LibraAlternative"
            case altPisces = "PiscesAlternative"
            case altSagittarius = "SagittariusAlternative"
            case altScorpion = "ScorpionAlternative"
            case altTaurus = "TaurusAlternative"
            case altVirgo = "VirgoAlternative"
        }
    }
    
    struct AuthCompletion {
        enum authCompletion: String {
            case attention = "attention"
        }
    }
}

