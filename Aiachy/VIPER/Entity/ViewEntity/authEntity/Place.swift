//
//  Place.swift
//  Aiachy
//
//  Created by Mert Türedü on 21.07.2023.
//

import Foundation

struct Place: Identifiable {
    let id = UUID()
    let town: String
    let country: String
    let city: String
}
