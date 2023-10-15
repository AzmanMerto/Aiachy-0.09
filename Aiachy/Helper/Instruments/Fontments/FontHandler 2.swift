//
//  FontHandler.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import SwiftUI

struct FontHandler {
    
    //MARK: FontHandler - CinzelDecorative
    static var CinzelBold12: Font = .custom(FontHelper().CinzelBold, size: 12)
    static var CinzelBold14: Font = .custom(FontHelper().CinzelBold, size: 14)
    
    static var CinzelBlack20: Font = .custom(FontHelper().CinzelBlack, size: 20)
    
    //MARK: FontHandler - OldStandartTT
    static var OldItalic10: Font = .custom(FontHelper().oldItalic, size: 10)
    static var OldItalic14: Font = .custom(FontHelper().oldItalic, size: 14)
    
    static var OldBold14: Font = .custom(FontHelper().OldBold, size: 14)
    
    static var OldRegular10: Font = .custom(FontHelper().oldRegular, size: 10)
    
    //MARK: FontHandler - SF Pro Rounded
    static var RoundedRegular10: Font = .system(.caption2, design: .rounded).weight(.regular)
    
    static var RoundedMedium10: Font = .system(.caption, design: .rounded).weight(.medium)
    static var RoundedMedium16: Font = .system(.body, design: .rounded).weight(.medium)
    
    static var RoundedBold14: Font = .system(.callout, design: .rounded).weight(.bold)
    static var RoundedBold16: Font = .system(.callout, design: .rounded).weight(.bold)
    
    static var RoundedBlack8: Font = .system(.caption2, design: .rounded).weight(.black)
    
    enum aiachyFontType {
        //MARK: FontHandler - enum CinzelDecorative
        case cinzelBold12
        case cinzelBold14
        
        case cinzelBlack20
        //MARK: FontHandler - enum OldStandartTT
        case oldItalic10
        case oldItalic14
        
        case oldBold14
        
        case oldRegular10
        //MARK: FontHandler - enum SF Pro Rounded
        case roundedRegular10
        
        case roundedMedium10
        case roundedMedium16
        
        case roundedBold14
        case roundedBold16
        
        case roundedBlack8
    }
}
