//
//  TextHandler.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct TextHandler {
    
    static let Turkish = TurkishLanguage()
    static let EnglishUSA = EnglishUSALanguage()
    static let EnglishUK = EnglishUKLanguage()
    static let Romanian = RomanianLanguage()
    static let Polish = PolishLanguage()
    static let Greek = GreekLanguage()
    static let Arabic = ArabicLanguage()
    static let Danish = DanishLanguage()
    static let French = FrenchLanguage()
    static let German = GermanLanguage()
    static let Russian = RussianLanguage()
    static let Italian = ItalianLanguage()
    static let Ukrainian = UkrainianLanguage()
    
    //MARK: - TextHandler - textHelperGeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    // textHelperGeneralCompletion - makeGeneralButton
    static func makeGeneralButtonString(aiachy aiachyState: AiachyState, button: textHelperGeneralCompletion.button) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.generalButton[button]!
        case "DK":
            return Danish.generalButton[button]!
        case "FR":
            return French.generalButton[button]!
        case "DE":
            return German.generalButton[button]!
        case "GR":
            return Greek.generalButton[button]!
        case "GB":
            return EnglishUSA.generalButton[button]!
        case "AE":
            return Arabic.generalButton[button]!
        case "PL":
            return Polish.generalButton[button]!
        case "IT":
            return Italian.generalButton[button]!
        case "RO":
            return Romanian.generalButton[button]!
        case "RU":
            return Russian.generalButton[button]!
        case "UA":
            return Ukrainian.generalButton[button]!
        case "US":
            return EnglishUSA.generalButton[button]!
        default:
            return EnglishUSA.generalButton[button]!
        }
    }
    // textHelperGeneralCompletion - makeGeneralFlag
    static func makeGeneralFlagString(aiachy aiachyState: AiachyState, flag: textHelperGeneralCompletion.flag) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.generalFlag[flag]!
        case "DK":
            return Danish.generalFlag[flag]!
        case "FR":
            return French.generalFlag[flag]!
        case "DE":
            return German.generalFlag[flag]!
        case "GR":
            return Greek.generalFlag[flag]!
        case "GB":
            return EnglishUSA.generalFlag[flag]!
        case "AE":
            return Arabic.generalFlag[flag]!
        case "PL":
            return Polish.generalFlag[flag]!
        case "IT":
            return Italian.generalFlag[flag]!
        case "RO":
            return Romanian.generalFlag[flag]!
        case "RU":
            return Russian.generalFlag[flag]!
        case "UA":
            return Ukrainian.generalFlag[flag]!
        case "US":
            return EnglishUSA.generalFlag[flag]!
        default:
            return EnglishUSA.generalFlag[flag]!
        }
    }
    //MARK: - TextHandler - AlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    // AlertCompletion - makeAlertButtonString
    static func makeAlertButtonString(aiachy aiachyState: AiachyState,  button: textHelperAlertCompletion.button) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.alertButton[button]!
        case "DK":
            return Danish.alertButton[button]!
        case "FR":
            return French.alertButton[button]!
        case "DE":
            return German.alertButton[button]!
        case "GR":
            return Greek.alertButton[button]!
        case "GB":
            return EnglishUSA.alertButton[button]!
        case "AE":
            return Arabic.alertButton[button]!
        case "PL":
            return Polish.alertButton[button]!
        case "IT":
            return Italian.alertButton[button]!
        case "RO":
            return Romanian.alertButton[button]!
        case "RU":
            return Russian.alertButton[button]!
        case "UA":
            return Ukrainian.alertButton[button]!
        case "US":
            return EnglishUSA.alertButton[button]!
        default:
            return EnglishUSA.alertButton[button]!
        }
    }
    // AlertCompletion - makeAlertString
    static func makeAlertString(aiachy aiachyState: AiachyState, alert: textHelperAlertCompletion.alert) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.alert[alert]!
        case "DK":
            return Danish.alert[alert]!
        case "FR":
            return French.alert[alert]!
        case "DE":
            return German.alert[alert]!
        case "GR":
            return Greek.alert[alert]!
        case "GB":
            return EnglishUSA.alert[alert]!
        case "AE":
            return Arabic.alert[alert]!
        case "PL":
            return Polish.alert[alert]!
        case "IT":
            return Italian.alert[alert]!
        case "RO":
            return Romanian.alert[alert]!
        case "RU":
            return Russian.alert[alert]!
        case "UA":
            return Ukrainian.alert[alert]!
        case "US":
            return EnglishUSA.alert[alert]!
        default:
            return EnglishUSA.alert[alert]!
        }
        
    }
    //MARK: - TextHandler - TextFieldCompletion -
    typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
    // TextFieldCompletion - makeTextField
    static func makeTextFieldString(aiachy aiachyState: AiachyState, textField: textHelperTextFieldCompletion.textField) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.textField[textField]!
        case "DK":
            return Danish.textField[textField]!
        case "FR":
            return French.textField[textField]!
        case "DE":
            return German.textField[textField]!
        case "GR":
            return Greek.textField[textField]!
        case "GB":
            return EnglishUSA.textField[textField]!
        case "AE":
            return Arabic.textField[textField]!
        case "PL":
            return Polish.textField[textField]!
        case "IT":
            return Italian.textField[textField]!
        case "RO":
            return Romanian.textField[textField]!
        case "RU":
            return Russian.textField[textField]!
        case "UA":
            return Ukrainian.textField[textField]!
        case "US":
            return EnglishUSA.textField[textField]!
        default:
            return EnglishUSA.textField[textField]!
        }
    }
    // TextFieldCompletion - textFieldError
    static func maketextFieldErrorString(aiachy aiachyState: AiachyState, textFieldError: textHelperTextFieldCompletion.error) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.textFieldError[textFieldError]!
        case "DK":
            return Danish.textFieldError[textFieldError]!
        case "FR":
            return French.textFieldError[textFieldError]!
        case "DE":
            return German.textFieldError[textFieldError]!
        case "GR":
            return Greek.textFieldError[textFieldError]!
        case "GB":
            return EnglishUSA.textFieldError[textFieldError]!
        case "AE":
            return Arabic.textFieldError[textFieldError]!
        case "PL":
            return Polish.textFieldError[textFieldError]!
        case "IT":
            return Italian.textFieldError[textFieldError]!
        case "RO":
            return Romanian.textFieldError[textFieldError]!
        case "RU":
            return Russian.textFieldError[textFieldError]!
        case "UA":
            return Ukrainian.textFieldError[textFieldError]!
        case "US":
            return EnglishUSA.textFieldError[textFieldError]!
        default:
            return EnglishUSA.textFieldError[textFieldError]!
        }
    }
    // MARK: -  TextHandler - AuthCompletion -
    typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    // AuthCompletion - auth title
    static func makeAuthTitleString(aiachy aiachyState: AiachyState, title: textHelperAuthCompletion.title) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.authTitle[title]!
        case "DK":
            return Danish.authTitle[title]!
        case "FR":
            return French.authTitle[title]!
        case "DE":
            return German.authTitle[title]!
        case "GR":
            return Greek.authTitle[title]!
        case "GB":
            return EnglishUSA.authTitle[title]!
        case "AE":
            return Arabic.authTitle[title]!
        case "PL":
            return Polish.authTitle[title]!
        case "IT":
            return Italian.authTitle[title]!
        case "RO":
            return Romanian.authTitle[title]!
        case "RU":
            return Russian.authTitle[title]!
        case "UA":
            return Ukrainian.authTitle[title]!
        case "US":
            return EnglishUSA.authTitle[title]!
        default:
            return EnglishUSA.authTitle[title]!
        }
    }
    static func makeAuthDescriptionString(aiachy aiachyState: AiachyState, description: textHelperAuthCompletion.description) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.authDescription[description]!
        case "DK":
            return Danish.authDescription[description]!
        case "FR":
            return French.authDescription[description]!
        case "DE":
            return German.authDescription[description]!
        case "GR":
            return Greek.authDescription[description]!
        case "GB":
            return EnglishUSA.authDescription[description]!
        case "AE":
            return Arabic.authDescription[description]!
        case "PL":
            return Polish.authDescription[description]!
        case "IT":
            return Italian.authDescription[description]!
        case "RO":
            return Romanian.authDescription[description]!
        case "RU":
            return Russian.authDescription[description]!
        case "UA":
            return Ukrainian.authDescription[description]!
        case "US":
            return EnglishUSA.authDescription[description]!
        default:
            return EnglishUSA.authDescription[description]!
        }
    }
    
    
    // AuthCompletion - AuthOnboarding
    static func makeAuthOnboardingString(aiachy aiachyState: AiachyState, onboarding: textHelperAuthCompletion.onboarding) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.authOnboarding[onboarding]!
        case "DK":
            return Danish.authOnboarding[onboarding]!
        case "FR":
            return French.authOnboarding[onboarding]!
        case "DE":
            return German.authOnboarding[onboarding]!
        case "GR":
            return Greek.authOnboarding[onboarding]!
        case "GB":
            return EnglishUSA.authOnboarding[onboarding]!
        case "AE":
            return Arabic.authOnboarding[onboarding]!
        case "PL":
            return Polish.authOnboarding[onboarding]!
        case "IT":
            return Italian.authOnboarding[onboarding]!
        case "RO":
            return Romanian.authOnboarding[onboarding]!
        case "RU":
            return Russian.authOnboarding[onboarding]!
        case "UA":
            return Ukrainian.authOnboarding[onboarding]!
        case "US":
            return EnglishUSA.authOnboarding[onboarding]!
        default:
            return EnglishUSA.authOnboarding[onboarding]!
        }
    }
    // AuthCompletion - AuthHelperAuth
    static func makeAuthHelperAuthString(aiachy aiachyState: AiachyState, helperAuth: textHelperAuthCompletion.helperAuth) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.authHelperAuth[helperAuth]!
        case "DK":
            return Danish.authHelperAuth[helperAuth]!
        case "FR":
            return French.authHelperAuth[helperAuth]!
        case "DE":
            return German.authHelperAuth[helperAuth]!
        case "GR":
            return Greek.authHelperAuth[helperAuth]!
        case "GB":
            return EnglishUSA.authHelperAuth[helperAuth]!
        case "AE":
            return Arabic.authHelperAuth[helperAuth]!
        case "PL":
            return Polish.authHelperAuth[helperAuth]!
        case "IT":
            return Italian.authHelperAuth[helperAuth]!
        case "RO":
            return Romanian.authHelperAuth[helperAuth]!
        case "RU":
            return Russian.authHelperAuth[helperAuth]!
        case "UA":
            return Ukrainian.authHelperAuth[helperAuth]!
        case "US":
            return EnglishUSA.authHelperAuth[helperAuth]!
        default:
            return EnglishUSA.authHelperAuth[helperAuth]!
        }
    }
    // MARK: -  TextHandler - HomeCompletion -
    typealias textHelperHomeCompletion = TextHelper.HomeCompletion
    static func makeHomeString(aiachy aiachyState: AiachyState, home: textHelperHomeCompletion.home) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.home[home]!
        case "DK":
            return Danish.home[home]!
        case "FR":
            return French.home[home]!
        case "DE":
            return German.home[home]!
        case "GR":
            return Greek.home[home]!
        case "GB":
            return EnglishUSA.home[home]!
        case "AE":
            return Arabic.home[home]!
        case "PL":
            return Polish.home[home]!
        case "IT":
            return Italian.home[home]!
        case "RO":
            return Romanian.home[home]!
        case "RU":
            return Russian.home[home]!
        case "UA":
            return Ukrainian.home[home]!
        case "US":
            return EnglishUSA.home[home]!
        default:
            return EnglishUSA.home[home]!
        }
    }
    
    static func makeHomeDateString(aiachy aiachyState: AiachyState, date: textHelperHomeCompletion.date) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.homeDate[date]!
        case "DK":
            return Danish.homeDate[date]!
        case "FR":
            return French.homeDate[date]!
        case "DE":
            return German.homeDate[date]!
        case "GR":
            return Greek.homeDate[date]!
        case "GB":
            return EnglishUSA.homeDate[date]!
        case "AE":
            return Arabic.homeDate[date]!
        case "PL":
            return Polish.homeDate[date]!
        case "IT":
            return Italian.homeDate[date]!
        case "RO":
            return Romanian.homeDate[date]!
        case "RU":
            return Russian.homeDate[date]!
        case "UA":
            return Ukrainian.homeDate[date]!
        case "US":
            return EnglishUSA.homeDate[date]!
        default:
            return EnglishUSA.homeDate[date]!
        }
    }
    
    static func makeHomeStatusString(aiachy aiachyState: AiachyState, homeStatus: textHelperHomeCompletion.status) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.homeStatus[homeStatus]!
        case "DK":
            return Danish.homeStatus[homeStatus]!
        case "FR":
            return French.homeStatus[homeStatus]!
        case "DE":
            return German.homeStatus[homeStatus]!
        case "GR":
            return Greek.homeStatus[homeStatus]!
        case "GB":
            return EnglishUSA.homeStatus[homeStatus]!
        case "AE":
            return Arabic.homeStatus[homeStatus]!
        case "PL":
            return Polish.homeStatus[homeStatus]!
        case "IT":
            return Italian.homeStatus[homeStatus]!
        case "RO":
            return Romanian.homeStatus[homeStatus]!
        case "RU":
            return Russian.homeStatus[homeStatus]!
        case "UA":
            return Ukrainian.homeStatus[homeStatus]!
        case "US":
            return EnglishUSA.homeStatus[homeStatus]!
        default:
            return EnglishUSA.homeStatus[homeStatus]!
        }
    }
    
    // MARK: - TextHelper - LoveCompletion -
    typealias textHelperLoveCompletion = TextHelper.LoveCompletion
    // LoveCompletion - makeLoveString
    static func makeLoveString(aiachy aiachyState: AiachyState, love: textHelperLoveCompletion.love) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.love[love]!
        case "DK":
            return Danish.love[love]!
        case "FR":
            return French.love[love]!
        case "DE":
            return German.love[love]!
        case "GR":
            return Greek.love[love]!
        case "GB":
            return EnglishUSA.love[love]!
        case "AE":
            return Arabic.love[love]!
        case "PL":
            return Polish.love[love]!
        case "IT":
            return Italian.love[love]!
        case "RO":
            return Romanian.love[love]!
        case "RU":
            return Russian.love[love]!
        case "UA":
            return Ukrainian.love[love]!
        case "US":
            return EnglishUSA.love[love]!
        default:
            return EnglishUSA.love[love]!
        }
    }
    // MARK: - TextHelper - MysticCompletion -
    typealias textHelperMysticCompletion = TextHelper.MysticCompletion
    // MysticCompletion - makeMysticString
    static func makeMysticString(aiachy aiachyState: AiachyState, mystic: textHelperMysticCompletion.mystic) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.mystic[mystic]!
        case "DK":
            return Danish.mystic[mystic]!
        case "FR":
            return French.mystic[mystic]!
        case "DE":
            return German.mystic[mystic]!
        case "GR":
            return Greek.mystic[mystic]!
        case "GB":
            return EnglishUSA.mystic[mystic]!
        case "AE":
            return Arabic.mystic[mystic]!
        case "PL":
            return Polish.mystic[mystic]!
        case "IT":
            return Italian.mystic[mystic]!
        case "RO":
            return Romanian.mystic[mystic]!
        case "RU":
            return Russian.mystic[mystic]!
        case "UA":
            return Ukrainian.mystic[mystic]!
        case "US":
            return EnglishUSA.mystic[mystic]!
        default:
            return EnglishUSA.mystic[mystic]!
        }
    }
    // MARK: - TextHelper - GalaxyCompletion -
    typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
    // GalaxyCompletion - makeGalaxy
    static func makeGalaxy(aiachy aiachyState: AiachyState, galaxy: textHelperGalaxyCompletion.galaxy) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        switch localized {
        case "TR":
            return Turkish.galaxy[galaxy]!
        case "DK":
            return Danish.galaxy[galaxy]!
        case "FR":
            return French.galaxy[galaxy]!
        case "DE":
            return German.galaxy[galaxy]!
        case "GR":
            return Greek.galaxy[galaxy]!
        case "GB":
            return EnglishUSA.galaxy[galaxy]!
        case "AE":
            return Arabic.galaxy[galaxy]!
        case "PL":
            return Polish.galaxy[galaxy]!
        case "IT":
            return Italian.galaxy[galaxy]!
        case "RO":
            return Romanian.galaxy[galaxy]!
        case "RU":
            return Russian.galaxy[galaxy]!
        case "UA":
            return Ukrainian.galaxy[galaxy]!
        case "US":
            return EnglishUSA.galaxy[galaxy]!
        default:
            return EnglishUSA.galaxy[galaxy]!
        }
    }
    // GalaxyCompletion - makeGalaxyTune
    static func makeGalaxyTune(aiachy aiachyState: AiachyState, galaxyTune: textHelperGalaxyCompletion.tune) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.galaxyTune[galaxyTune]!
        case "DK":
            return Danish.galaxyTune[galaxyTune]!
        case "FR":
            return French.galaxyTune[galaxyTune]!
        case "DE":
            return German.galaxyTune[galaxyTune]!
        case "GR":
            return Greek.galaxyTune[galaxyTune]!
        case "GB":
            return EnglishUSA.galaxyTune[galaxyTune]!
        case "AE":
            return Arabic.galaxyTune[galaxyTune]!
        case "PL":
            return Polish.galaxyTune[galaxyTune]!
        case "IT":
            return Italian.galaxyTune[galaxyTune]!
        case "RO":
            return Romanian.galaxyTune[galaxyTune]!
        case "RU":
            return Russian.galaxyTune[galaxyTune]!
        case "UA":
            return Ukrainian.galaxyTune[galaxyTune]!
        case "US":
            return EnglishUSA.galaxyTune[galaxyTune]!
        default:
            return EnglishUSA.galaxyTune[galaxyTune]!
        }
    }
    //MARK: - TextHelper - SettingsCompletion -
    typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
    // SettingsCompletion - makeSettingsString
    static func makeSettingsString(aiachy aiachyState: AiachyState, settings: textHelperSettingsCompletion.settings) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.settings[settings]!
        case "DK":
            return Danish.settings[settings]!
        case "FR":
            return French.settings[settings]!
        case "DE":
            return German.settings[settings]!
        case "GR":
            return Greek.settings[settings]!
        case "GB":
            return EnglishUSA.settings[settings]!
        case "AE":
            return Arabic.settings[settings]!
        case "PL":
            return Polish.settings[settings]!
        case "IT":
            return Italian.settings[settings]!
        case "RO":
            return Romanian.settings[settings]!
        case "RU":
            return Russian.settings[settings]!
        case "UA":
            return Ukrainian.settings[settings]!
        case "US":
            return EnglishUSA.settings[settings]!
        default:
            return EnglishUSA.settings[settings]!
        }
    }
    // SettingsCompletion - makeSettingsLanguageString
    static func makeSettingsLanguageString(aiachy aiachyState: AiachyState, language: textHelperSettingsCompletion.language) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.settingsLanguage[language]!
        case "DK":
            return Danish.settingsLanguage[language]!
        case "FR":
            return French.settingsLanguage[language]!
        case "DE":
            return German.settingsLanguage[language]!
        case "GR":
            return Greek.settingsLanguage[language]!
        case "GB":
            return EnglishUSA.settingsLanguage[language]!
        case "AE":
            return Arabic.settingsLanguage[language]!
        case "PL":
            return Polish.settingsLanguage[language]!
        case "IT":
            return Italian.settingsLanguage[language]!
        case "RO":
            return Romanian.settingsLanguage[language]!
        case "RU":
            return Russian.settingsLanguage[language]!
        case "UA":
            return Ukrainian.settingsLanguage[language]!
        case "US":
            return EnglishUSA.settingsLanguage[language]!
        default:
            return EnglishUSA.settingsLanguage[language]!
        }
    }
    
    static func makeSettingsOracleString(aiachy aiachyState: AiachyState, oracle: textHelperSettingsCompletion.oracle) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        
        switch localized {
        case "TR":
            return Turkish.settingsOracle[oracle]!
        case "DK":
            return Danish.settingsOracle[oracle]!
        case "FR":
            return French.settingsOracle[oracle]!
        case "DE":
            return German.settingsOracle[oracle]!
        case "GR":
            return Greek.settingsOracle[oracle]!
        case "GB":
            return EnglishUSA.settingsOracle[oracle]!
        case "AE":
            return Arabic.settingsOracle[oracle]!
        case "PL":
            return Polish.settingsOracle[oracle]!
        case "IT":
            return Italian.settingsOracle[oracle]!
        case "RO":
            return Romanian.settingsOracle[oracle]!
        case "RU":
            return Russian.settingsOracle[oracle]!
        case "UA":
            return Ukrainian.settingsOracle[oracle]!
        case "US":
            return EnglishUSA.settingsOracle[oracle]!
        default:
            return EnglishUSA.settingsOracle[oracle]!
        }
    }
    // MARK: - TextHandler - ZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    static func makeCrystalZodiacString(aiachy aiachyState: AiachyState, crystal: textHelperSpiritualCompletion.crystalName) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        switch localized {
        case "TR":
            return Turkish.crystalZodiac[crystal]!
        case "DK":
            return Danish.crystalZodiac[crystal]!
        case "FR":
            return French.crystalZodiac[crystal]!
        case "DE":
            return German.crystalZodiac[crystal]!
        case "GR":
            return Greek.crystalZodiac[crystal]!
        case "GB":
            return EnglishUSA.crystalZodiac[crystal]!
        case "AE":
            return Arabic.crystalZodiac[crystal]!
        case "PL":
            return Polish.crystalZodiac[crystal]!
        case "IT":
            return Italian.crystalZodiac[crystal]!
        case "RO":
            return Romanian.crystalZodiac[crystal]!
        case "RU":
            return Russian.crystalZodiac[crystal]!
        case "UA":
            return Ukrainian.crystalZodiac[crystal]!
        case "US":
            return EnglishUSA.crystalZodiac[crystal]!
        default:
            return EnglishUSA.crystalZodiac[crystal]!
        }
    }
    
    // ZodiacCompletion - makeDateZodiacString
    static func makeDateZodiacString(aiachy aiachyState: AiachyState, date: textHelperSpiritualCompletion.dateZodiac) -> String {
        let localized = aiachyState.user.aiachyInfo.wrappedLanguage
        switch localized {
        case "TR":
            return Turkish.dateZodiac[date]!
        case "DK":
            return Danish.dateZodiac[date]!
        case "FR":
            return French.dateZodiac[date]!
        case "DE":
            return German.dateZodiac[date]!
        case "GR":
            return Greek.dateZodiac[date]!
        case "GB":
            return EnglishUSA.dateZodiac[date]!
        case "AE":
            return Arabic.dateZodiac[date]!
        case "PL":
            return Polish.dateZodiac[date]!
        case "IT":
            return Italian.dateZodiac[date]!
        case "RO":
            return Romanian.dateZodiac[date]!
        case "RU":
            return Russian.dateZodiac[date]!
        case "UA":
            return Ukrainian.dateZodiac[date]!
        case "US":
            return EnglishUSA.dateZodiac[date]!
        default:
            return EnglishUSA.dateZodiac[date]!
        }
    }

}
