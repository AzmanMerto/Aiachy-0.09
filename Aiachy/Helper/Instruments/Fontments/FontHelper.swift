//
//  FontHelper.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import Foundation
import SwiftUI

struct FontHelper {
    var CinzelBlack = "CinzelDecorative-Black"
    var CinzelBold = "CinzelDecorative-Bold"
    var CinzelRegular = "CinzelDecorative-Regular"
    
    var OldBold = "OldStandardTT-Bold"
    var oldRegular = "OldStandardTT-Regular"
    var oldItalic = "OldStandardTT-Italic"
    
    
    //MARK: FontHandler - CinzelDecorative
    static var CinzelBold12: Font = .custom(FontHelper().CinzelBold, size: 12)
    static var CinzelBold14: Font = .custom(FontHelper().CinzelBold, size: 14)
    
    static var CinzelBlack12: Font = .custom(FontHelper().CinzelBold, size: 12)
    static var CinzelBlack20: Font = .custom(FontHelper().CinzelBlack, size: 20)
    static var CinzelBlack22: Font = .custom(FontHelper().CinzelBlack, size: 22)
    static var CinzelBlack30: Font = .custom(FontHelper().CinzelBlack, size: 30)
    static var CinzelBlack50: Font = .custom(FontHelper().CinzelBlack, size: 50)
    //MARK: FontHandler - OldStandartTT
    static var OldItalic10: Font = .custom(FontHelper().oldItalic, size: 10)
    static var OldItalic12: Font = .custom(FontHelper().oldItalic, size: 12)
    static var OldItalic14: Font = .custom(FontHelper().oldItalic, size: 14)
    
    static var OldBold12: Font = .custom(FontHelper().OldBold, size: 12)
    static var OldBold14: Font = .custom(FontHelper().OldBold, size: 14)
    
    static var OldRegular10: Font = .custom(FontHelper().oldRegular, size: 10)
    static var OldRegular13: Font = .custom(FontHelper().oldRegular, size: 13)
    //MARK: FontHandler - SF Pro Rounded
    static var RoundedRegular10: Font = .system(size: 10, weight: .regular, design: .rounded)
    static var RoundedRegular12: Font = .system(size: 12, weight: .regular, design: .rounded)
    
    static var RoundedMedium10: Font = .system(size: 10, weight: .medium, design: .rounded)
    static var RoundedMedium12: Font = .system(size: 12, weight: .medium, design: .rounded)
    static var RoundedMedium16: Font = .system(size: 16, weight: .medium, design: .rounded)
    
    static var RoundedSemiBold12: Font = .system(size: 12, weight: .semibold, design: .rounded)
    
    static let RoundedBold10: Font = .system(size: 10, weight: .bold, design: .rounded)
    static var RoundedBold12: Font = .system(size: 12, weight: .bold, design: .rounded)
    static var RoundedBold14: Font = .system(size: 14, weight: .bold, design: .rounded)
    static var RoundedBold16: Font = .system(size: 16, weight: .bold, design: .rounded)
    static var RoundedBold20: Font = .system(size: 20, weight: .bold, design: .rounded)
    
    static var RoundedBlack8: Font = .system(size: 8, weight: .black, design: .rounded)
    
    enum aiachyFontType {
        //MARK: FontHandler - enum CinzelDecorative
        case cinzelBold12
        case cinzelBold14
        
        case cinzelBlack12
        case cinzelBlack20
        case cinzelBlack22
        case CinzelBlack30
        case CinzelBlack50
        //MARK: FontHandler - enum OldStandartTT
        case oldItalic10
        case oldItalic12
        case oldItalic14
        
        case oldBold12
        case oldBold14
        
        case oldRegular10
        case oldRegular13
        //MARK: FontHandler - enum SF Pro Rounded
        case roundedRegular10
        case roundedRegular12
        
        case roundedMedium10
        case roundedMedium12
        case roundedMedium16
        
        case roundedSemiBold12
        
        case roundedBold10
        case roundedBold12
        case roundedBold14
        case roundedBold16
        case roundedBold20
        
        case roundedBlack8
    }
}
