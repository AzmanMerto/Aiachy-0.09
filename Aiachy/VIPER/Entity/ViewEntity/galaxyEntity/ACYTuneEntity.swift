//
//  ACYTuneEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 10.08.2023.
//

import Foundation

struct ACYTuneEntity: Codable {
    var tuneId: String?
    var name: String?
    var determinedZodiac: Int?
    var isPremium: Bool?
    var url: String?
    var statement: String?
    var tuneDataVersion: String?
    var duration: Int?
}
