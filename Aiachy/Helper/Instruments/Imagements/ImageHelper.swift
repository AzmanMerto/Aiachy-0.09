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
    //MARK: - ImageHelper - GeneralCompletion -
    struct GeneralCompletion {
        enum app: String {
            case appLogo = "appLogo"
        }
        
        enum flag: String {
            case unitedArabEmirates = "Flag-AE"
            case germany = "Flag-DE"
            case denmark = "Flag-DK"
            case france = "Flag-FR"
            case unitedKingdom = "Flag-GB"
            case greece = "Flag-GR"
            case italy = "Flag-IT"
            case poland = "Flag-PL"
            case romania = "Flag-RO"
            case russianFederation = "Flag-RU"
            case türkiye = "Flag-TR"
            case ukraine = "Flag-UA"
            case unitedStates = "Flag-US"
        }
        
        enum button: String {
            case rightArrowButton = "rightArrowButton"
            case leftArrowButton = "leftArrowButton"
        }
    }
    //MARK: - ImageHelper - AlertCompletion -
    struct AlertCompletion {
        enum alert: String {
            case notUserHaveConnection = "notUserHaveConnection"
            case notAscendantSelection = "authAscendantSelectionBackground"
            case needToRegister = "needToRegister"
            case notReady = "notReady"
        }
    }
    //MARK: - ImageHelper - AuthCompletion -
    struct AuthCompletion {
        enum auth: String {
            case authLoginBackground = "authLoginBackground"
            case ascendantSelectionBackground = "authAscendantSelectionBackground"
            case attention = "attention"
        }
        enum onboarding: String {
            case authHeart = "authHeart"
            case secretStar = "authSecretStar"
            case yourFuture = "authYourFuture"
        }
        enum staticBackground: String {
            case authBackgroundSymbol1 = "authBackgroundSymbol1"
            case authBackgroundSymbol2 = "authBackgroundSymbol2"
            case authBackgroundSymbol3 = "authBackgroundSymbol3"
            case authBackgroundSymbolTest = "authBackgroundSymbolTest"
        }
    }
    //MARK: - ImageHelper - HomeCompletion -
    struct HomeCompletion {
        
        enum home: String {
            case homeBackground = "homeBackground"
            case topImage = "topImage"
            case lock = "lock"
        }
        
        enum tabBarLogo: String {
            case mysticLogoUnSelected = "mysticLogoUnSelected"
            case mysticLogoSelected = "mysticLogoSelected"
            case loveLogoUnSelected = "loveLogoUnSelected"
            case loveLogoSelected = "loveLogoSelected"
            case galaxyLogoUnSelected = "galaxyLogoUnSelected"
            case galaxyLogoSelected = "galaxyLogoSelected"
            case settingsLogoUnSelected = "settingsLogoUnSelected"
            case settingsLogoSelected = "settingsLogoSelected"
        }
    }
    //MARK: - ImageHelper - MysticCompletion -
    struct MysticCompletion {
        enum starter: String {
            case tarotStarter1 = "tarotStarter1"
            case tarotStarter2 = "tarotStarter2"
            case palmistryStarter1 = "palmistryStarter1"
            case palmistryStarter2 = "palmistryStarter2"
            case palmistryStarter3 = "palmistryStarter3"
            case crystalGazingStarter1 = "crystalGazingStarter1"
            case crystalGazingStarter2 = "crystalGazingStarter2"
            case crystalGazingStarterLogoSelected = "crystalGazingStarterLogoSelected"
            case crystalGazingStarterLogoUnSelected = "crystalGazingStarterLogoUnSelected"
            case palmistryLogoSelected = "palmistryStarterLogoSelected"
            case palmistryLogoUnSelected = "palmistryStarterLogoUnSelected"
            case tarotLogoSelected = "tarotStarterLogoSelected"
            case tarotLogoUnSelected = "tarotStarterLogoUnSelected"
        }
    }
    //MARK: - ImageHelper - GalaxyCompletion -
    struct GalaxyCompletion {
        enum galaxy: String {
            case tuneLogo = "tuneLogo"
            case maditationLogo = "meditationLogo"
        }
    }
    //MARK: - ImageHelper - SettingsCompletion -
    struct SettingsCompletion {
        enum settings: String {
            case aicyCashLogo = "aicyCashLogo"
            case oracleLogo = "oracleLogo"
            case languageLogo = "languageLogo"
            case themeLogo = "themeLogo"
        }
        
        enum aicyCash: String {
            case aicyCashBackground = "aicyCashBackground"
        }
        enum oracle: String {
            case oracleltem = "oracleltem"
            case oracleOracle = "oracleOracle"
            case oracleOccult = "oracleOccult"
        }
        enum theme: String {
            case themeDark = "themeDark"
            case themeLight = "themeLight"
        }
    }
    //MARK: - ImageHelper - LoveCompletion -
    struct LoveCompletion {
        enum love: String {
            case loveAttention = "loveAttention"
        }
    }
    struct SpiritualCompletion {
        enum crystalZodiac: String {
            case ariesCrystal = "ariesCrystal"
            case taurusCrystal = "taurusCrystal"
            case geminiCrystal = "geminiCrystal"
            case cancerCrystal = "cancerCrystal"
            case leoCrystal = "leoCrystal"
            case virgoCrystal = "virgoCrystal"
            case libraCrystal = "libraCrystal"
            case scorpioCrystal = "scorpioCrystal"
            case sagittariusCrystal = "sagittariusCrystal"
            case capricornCrystal = "capricornCrystal"
            case aquariusCrystal = "aquariusCrystal"
            case piscesCrystal = "piscesCrystal"
        }
    }
}

