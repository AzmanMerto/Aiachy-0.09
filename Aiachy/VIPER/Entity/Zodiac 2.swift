//
//  Zodiac.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation

//MARK: Zodiac
struct Zodiac: Codable {
    var date: Date
    var zodiac: Int
    var dailyComment: String
    var dailySpecialComment: String
    var zodiacDataVersion: String
    var compatibilityZodiacs: [CompatibilityZodiacs]
    var zodiacStatus: ZodiacStatus
}

//MARK: Zodiac - CompatibilityZodiacs
struct CompatibilityZodiacs: Codable {
    var zodiac: Int?
    var comment: String?
}

//MARK: Zodiac - ZodiacStatus
struct ZodiacStatus: Codable {
    var overallStatus = OverallStatus()
    var loveStatus = LoveStatus()
    var businessLifeStatus = BusinessLifeStatus()
    var healthStatus = HealthStatus()
    var holidayStatus = HolidayStatus()
    var dietStatus = DietStatus()
}

//MARK: ZodiacStatus - OverallStatus
struct OverallStatus: Codable {
    var rate: Int?
    var statusComment: String?
}

//MARK: ZodiacStatus - LoveStatus
struct LoveStatus: Codable {
    var rate: Int?
    var statusComment: String?
}

//MARK: ZodiacStatus - BusinessLifeStatus
struct BusinessLifeStatus: Codable {
    var rate: Int?
    var statusComment: String?
}

//MARK: ZodiacStatus - HealthStatus
struct HealthStatus: Codable {
    var rate: Int?
    var statusComment: String?
}

//MARK: ZodiacStatus - HolidayStatus
struct HolidayStatus: Codable {
    var rate: Int?
    var statusComment: String?
}

//MARK: ZodiacStatus - DietStatus
struct DietStatus: Codable {
    var rate: Int?
    var statusComment: String?
}
