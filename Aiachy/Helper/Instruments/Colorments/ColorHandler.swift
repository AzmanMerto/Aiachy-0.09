//
//  ColorHandler.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI

struct ColorHandler {
    
    static func makeAiachyColor(_ aiachyState: AiachyState, aiachyColor: ColorHelper.ACYColors) -> String {
        switchValueWithThemeToString(aiachy: aiachyState, with: aiachyColor.rawValue)
   }
    
    static func makeAiachyColorsChacka(aiachy aiachyState: AiachyState, chackra: ColorHelper.Chackra) -> String {
        return chackra.rawValue
    }
}

extension ColorHandler {
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
