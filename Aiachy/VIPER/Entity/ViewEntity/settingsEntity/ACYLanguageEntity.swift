//
//  ACYLanguageEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import Foundation

struct ACYLanguageEntity: Equatable {
    var id: Int
    var image: ImageHelper.GeneralCompletion.flag
    var text: TextHelper.GeneralCompletion.flag
    var countryCode: String
    var localeIdentifier: String
    
    func makeLocal() -> Locale {
        Locale(identifier: localeIdentifier)
    }
}
