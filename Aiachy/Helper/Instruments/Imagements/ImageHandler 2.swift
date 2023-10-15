//
//  ImageHandler.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.05.2023.
//

import SwiftUI

//NextPatchTODO: Less code More Active
struct ImageHandler {
    //MARK: - ImageHandler - AppCompletion
    typealias imageHelperApp = ImageHelper.ACYAppImage
    static func getACYAppStringApp(_ aiachyTheme: ImageHelper.aiachyThemeImage, app: imageHelperApp.ACYappImage) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return app.rawValue
        case .AiachyDark:
            return app.rawValue + "-Dark"
        }
    }
    static func getACYAppStringAlert(_ aiachyTheme: ImageHelper.aiachyThemeImage, alert: imageHelperApp.ACYalertImage) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return alert.rawValue
        case .AiachyDark:
            return alert.rawValue + "-Dark"
        }
    }
    
    static func getACYAppStringOnboarding(_ aiachyTheme: ImageHelper.aiachyThemeImage, alert: imageHelperApp.ACYonboardingImage) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return alert.rawValue
        case .AiachyDark:
            return alert.rawValue + "-Dark"
        }
    }
    
    static func getACYAppStringButton(_ aiachyTheme: ImageHelper.aiachyThemeImage, button: imageHelperApp.button) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return button.rawValue
        case .AiachyDark:
            return button.rawValue + "-Dark"
        }
    }
    
    static func getACYAppStringBackground(_ aiachyTheme: ImageHelper.aiachyThemeImage, background: imageHelperApp.background) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return background.rawValue
        case .AiachyDark:
            return background.rawValue + "-Dark"
        }
    }
    //MARK: - ImageHandler - ZodiacCompletion
    typealias imageHelperZodiac = ImageHelper.ZodiacCompletion
    static func getACYZodiacString(_ aiachyTheme: ImageHelper.aiachyThemeImage, zodiac: imageHelperZodiac.ACYzodiacImage) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return zodiac.rawValue
        case .AiachyDark:
            return zodiac.rawValue + "-Dark"
        }
    }
    
    static func getACYZodiacAltString(_ aiachyTheme: ImageHelper.aiachyThemeImage, zodiacAlt: imageHelperZodiac.zodiacAlt) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return zodiacAlt.rawValue
        case .AiachyDark:
            return zodiacAlt.rawValue + "-Dark"
        }
    }
  
    //MARK: - ImageHandler - AuthCompletion
    typealias imageHelperAuth = ImageHelper.AuthCompletion
    static func getACYAuthString(_ aiachyTheme: ImageHelper.aiachyThemeImage, auth: imageHelperAuth.authCompletion) -> String {
        switch aiachyTheme {
        case .AiachyLight:
            return "\(auth.rawValue)"
        case .AiachyDark:
            return "\(auth.rawValue)" + "-Dark"
        }
    }
}

