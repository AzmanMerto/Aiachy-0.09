//
//  ACYStatusEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 28.08.2023.
//

import Foundation

// ACYChakraStatusEntity - Entity
struct ACYChakraStatusEntity: Codable {
    var serialNumber: Int
    var tier: Int
    var rate: Double
    var comment: String
    var statusDataVersion: String
}
