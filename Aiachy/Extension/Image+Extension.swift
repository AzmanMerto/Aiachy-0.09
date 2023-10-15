//
//  Image+Extension.swift
//  Aiachy
//
//  Created by Mert Türedü on 14.05.2023.
//

import SwiftUI

extension View {
    /// Taking zodiac number value and converting it to picture in anarchy state.
    /// - Parameter zodiac: To specify a picture by theme.
    /// - Returns: Picture rotates.
    func makeImageWithZodiacInt(aiachy aiachyState: AiachyState, zodiac: Int, isAlternative: Bool = true) -> Image {
        
        if isAlternative {
            switch zodiac {
            case 0:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState,crystal: .aquariusCrystal))
            case 1:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .taurusCrystal))
            case 2:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .geminiCrystal))
            case 3:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .cancerCrystal))
            case 4:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .leoCrystal))
            case 5:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .virgoCrystal))
            case 6:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .libraCrystal))
            case 7:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .scorpioCrystal))
            case 8:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .sagittariusCrystal))
            case 9:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .capricornCrystal))
            case 10:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .aquariusCrystal))
            case 11:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .piscesCrystal))
            default:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .leoCrystal))
            }
        } else {
            switch zodiac {
            case 0:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .aquariusCrystal))
            case 1:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .taurusCrystal))
            case 2:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .geminiCrystal))
            case 3:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .cancerCrystal))
            case 4:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .leoCrystal))
            case 5:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .virgoCrystal))
            case 6:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .libraCrystal))
            case 7:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .scorpioCrystal))
            case 8:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .sagittariusCrystal))
            case 9:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .capricornCrystal))
            case 10:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .aquariusCrystal))
            case 11:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .piscesCrystal))
            default:
                return Image(ImageHandler.makeCrystalZodiacString(aiachyState, crystal: .leoCrystal))
            }
        }
    }
    
    
}
