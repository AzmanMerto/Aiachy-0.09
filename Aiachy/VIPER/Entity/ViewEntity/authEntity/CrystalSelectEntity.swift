//
//  CrystalSelectEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation

struct CrystalSelectEntity: Identifiable {
    var id: Int
    var image: ImageHelper.SpiritualCompletion.crystalZodiac
    var name: TextHelper.SpiritualCompletion.crystalName
    var date: TextHelper.SpiritualCompletion.dateZodiac
}
