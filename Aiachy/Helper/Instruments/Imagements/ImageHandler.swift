//
//  ImageHandler.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.05.2023.
//

import SwiftUI

//NextPatchTODO: Less code More Active
struct ImageHandler {
    //MARK: - ImageHandler - AppCompletion -
    typealias imageHelperGeneralCompletion = ImageHelper.GeneralCompletion
    static func makeGeneralAppString(_ aiachyState: AiachyState,
                                          app: imageHelperGeneralCompletion.app) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: app.rawValue)
    }
    static func makeGeneralFlagString(flag: imageHelperGeneralCompletion.flag) -> String {
        flag.rawValue
    }
    static func makeGeneralButtonString(_ aiachyState: AiachyState,
                                             button: imageHelperGeneralCompletion.button) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: button.rawValue)
    }
    //MARK: - ImageHandler - AlertCompletion -
    typealias imageHelperAlertCompletion = ImageHelper.AlertCompletion
    static func makeAlertString(_ aiachyState: AiachyState,
                                     alert: imageHelperAlertCompletion.alert) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: alert.rawValue)
    }
    //MARK: - ImageHandler - AuthCompletion -
    typealias imageHelperAuthCompletion = ImageHelper.AuthCompletion
    static func makeAuthString(_ aiachyState: AiachyState,
                                    auth: imageHelperAuthCompletion.auth) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: auth.rawValue)
    }
    
    static func makeAuthOnboardingString(_ aiachyState: AiachyState,
                                              onboarding: imageHelperAuthCompletion.onboarding) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: onboarding.rawValue)
    }
    static func makeAuthStaticBackground(_ aiachyState: AiachyState,
                                         staticBackground: imageHelperAuthCompletion.staticBackground) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: staticBackground.rawValue)
    }
    //MARK: - ImageHandler - MysticCompletion -
    typealias imageHelperHomeCompletion = ImageHelper.HomeCompletion
    static func makeHomeString(_ aiachyState: AiachyState,
                               home: imageHelperHomeCompletion.home) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: home.rawValue)
    }
    static func makeHometabBarLogoString(_ aiachyState: AiachyState,
                                         tabBarLogo: imageHelperHomeCompletion.tabBarLogo) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: tabBarLogo.rawValue)
    }
    //MARK: - ImageHandler - MysticCompletion -
    typealias imageHelperMysticCompletion = ImageHelper.MysticCompletion
    static func makeMysticStarterString(_ aiachyState: AiachyState,
                                        starter: imageHelperMysticCompletion.starter) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: starter.rawValue)
    }
    //MARK: - ImageHandler - GalaxyCompletion -
    typealias imageHelperGalaxyCompletion = ImageHelper.GalaxyCompletion
    static func makeGalaxyString(_ aiachyState: AiachyState,
                                 galaxy: imageHelperGalaxyCompletion.galaxy) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: galaxy.rawValue)
    }
    //MARK: - ImageHandler - LoveCompletion -
    typealias imageHelperLove = ImageHelper.LoveCompletion
    static func makeLoveString(_ aiachyState: AiachyState,
                               love: imageHelperLove.love) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: love.rawValue)
    }
    //MARK: - ImageHandler - SettingsCompletion -
    typealias imageHelperSettingsCompletion = ImageHelper.SettingsCompletion
    static func makeSettingsString(_ aiachyState: AiachyState,
                                         settings: imageHelperSettingsCompletion.settings) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: settings.rawValue)
    }
    static func makeSettingsAicyCashString(_ aiachyState: AiachyState,
                                             aicyCash: imageHelperSettingsCompletion.aicyCash) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: aicyCash.rawValue)
    }
    static func makeSettingsOracleString(_ aiachyState: AiachyState, oracle: imageHelperSettingsCompletion.oracle) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: oracle.rawValue)
    }
    static func makeSettingsThemeString(_ aiachyState: AiachyState,theme: imageHelperSettingsCompletion.theme) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: theme.rawValue)
    }
    //MARK: - ImageHandler - SpiritualCompletion -
    typealias imageHelperSpiritualCompletion = ImageHelper.SpiritualCompletion
    static func makeCrystalZodiacString(_ aiachyState: AiachyState,
                                   crystal: imageHelperSpiritualCompletion.crystalZodiac) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: crystal.rawValue)
    }

}

extension ImageHandler {
    static func switchValueWithThemeToString(aiachy aiachyState: AiachyState, with value: String) -> String  {
        let aiachyTheme = aiachyState.user.aiachyInfo.wrappedTheme
        switch aiachyTheme {
        case "Light":
            return value
        case "Dark":
            return value + "-Dark"
        default:
            return value
        }
    }
}
