//
//  ACYZodiacEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation

//MARK: ACYZodiacEntity
struct ACYUserAllEntity: Codable {
    var zodiac: ACYZodiacEntity
    var ascendiant: [ACYAscendiantEntity]
    var compatibility: [ACYCompatibilityEntity]
    var chakraStatus: [ACYChakraStatusEntity]
}
