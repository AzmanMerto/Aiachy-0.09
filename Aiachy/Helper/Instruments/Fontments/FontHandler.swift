//
//  FontHandler.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import SwiftUI

struct FontHandler {
    
    static func aiachyFont(_ fontType: FontHelper.aiachyFontType) -> Font {
        switch fontType {
            
        case .cinzelBold12:
            return FontHelper.CinzelBold12
        case .cinzelBold14:
            return FontHelper.CinzelBold14
            
        case .cinzelBlack12:
            return FontHelper.CinzelBlack12
        case .cinzelBlack20:
            return FontHelper.CinzelBlack20
        case .cinzelBlack22:
            return FontHelper.CinzelBlack22
        case .CinzelBlack30:
            return FontHelper.CinzelBlack30
        case .CinzelBlack50:
            return FontHelper.CinzelBlack50
            
        case .oldItalic10:
            return FontHelper.OldItalic10
        case .oldItalic12:
            return FontHelper.OldItalic12
        case .oldItalic14:
            return FontHelper.OldItalic14
            
        case .oldBold12:
            return FontHelper.OldBold12
        case .oldBold14:
            return FontHelper.OldBold14
            
            
        case .oldRegular10:
            return FontHelper.OldRegular10
        case .oldRegular13:
            return FontHelper.OldRegular13
            
        case .roundedRegular10:
            return FontHelper.RoundedRegular10
        case .roundedRegular12:
            return FontHelper.RoundedRegular12
            
        case .roundedMedium10:
            return FontHelper.RoundedMedium10
        case .roundedMedium12:
            return FontHelper.RoundedMedium12
        case .roundedMedium16:
            return FontHelper.RoundedMedium16
            
        case .roundedSemiBold12:
            return FontHelper.RoundedSemiBold12
            
        case .roundedBold12:
            return FontHelper.RoundedBold12
        case .roundedBold10:
            return FontHelper.RoundedBold10
        case .roundedBold14:
            return FontHelper.RoundedBold14
        case .roundedBold16:
            return FontHelper.RoundedBold16
        case .roundedBold20:
            return FontHelper.RoundedBold20
            
        case .roundedBlack8:
            return FontHelper.RoundedBlack8

        }
    }
}
