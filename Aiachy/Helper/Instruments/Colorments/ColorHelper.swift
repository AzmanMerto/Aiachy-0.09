//
//  ColorHelper.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import Foundation

struct ColorHelper {
    
    /// Aiachy Themes
    enum aiachyThemeColor{
        case AiachyLight
        case AiachyDark
    }
    /// General colors used in Aiachy
    enum ACYColors: String {
        case firstColor = "1C"
        case secondColor = "2C"
        case thirdColor = "3C"
        case fourthColor = "4C"
        case fifthColor = "5C"
        case sixColor = "6C"
        case backgroundColor = "BC"
        case backgroundAlternativeColor = "BAC"
        case backgroundBlurColor = "BBC"
    }
    
    enum Chackra: String, CaseIterable {
        case firstChackra = "1Chackra"
        case secondChackra = "2Chackra"
        case thirdChackra = "3Chackra"
        case fourthChackra = "4Chackra"
        case fifthChackra = "5Chackra"
        case sixthChackra = "6Chackra"
        case seventhChackra = "7Chackra"
    }
}
