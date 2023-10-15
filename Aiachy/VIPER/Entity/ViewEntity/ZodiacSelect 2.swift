//
//  ZodiacSelect.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation

struct ZodiacSelect: Identifiable {
    var id: Int
    var zodiacImage: ImageHelper.ZodiacCompletion.zodiacAlt
    var selectedZodiacImage: ImageHelper.ZodiacCompletion.ACYzodiacImage
    var zodiacName: ACYTextHelper.ACYZodiacText.ACYzodiacNameText
    var zodiacShortedDate: ACYTextHelper.ACYZodiacText.ACYzodiacDateText
}
