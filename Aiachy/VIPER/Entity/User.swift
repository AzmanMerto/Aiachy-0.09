//
//  User.swift
//  Aiachy
//
//  Created by Mert Türedü on 14.05.2023.
//

import Foundation

/// User Main Model
//MARK: - User -
struct User: Codable {
    var userLoginInfo = UserLoginInfo()
    var userInfo = UserInfo()
    var userSpiritual = UserSpiritual()
    var userOracle = UserOracle()
    var aiachyInfo = AiachyInfo()
    var aiachyLove = AiachyLove()
    var aiachyMystic = AiachyMystic()
    var aiachyGalaxy = AiachyGalaxy()
    var deviceInfo = DeviceInfo()
    var userCompletion = UserCompletion()
}

// MARK  - User - UserLoginInfo -
struct UserLoginInfo: Codable {
    var email: String?
    var password: String?
    var number = UserNumber()
    var verification: Bool?
    
    var wrappedEmail: String {
        email ?? ""
    }
    
    var wrappedPassowrd: String {
        password ?? ""
    }
    
    var wrappedVerification: Bool {
        verification ?? false
    }
}

// MARK: - UserLoginInfo - PhoneNumber -
struct UserNumber: Codable {
    var countryCode: Int?
    var phoneNumber: Int?
    
    func makeUserPhone() -> String {
        "+\(wrappedCountryCode)\(wrappedPhoneNumber)"
    }
    
    var wrappedCountryCode: Int {
        countryCode ?? 00
    }
    var wrappedPhoneNumber: Int {
        phoneNumber ?? 0000000000
    }
}

// MARK: - User - UserInfo -
struct UserInfo: Codable {
    var id: String?
    var fullName = UserInfoFullName()
    var birthDay = UserInfoBirthDay()
    var location = UserInfoLocation()
    
    var wrappedId: String {
        id ?? ""
    }
}

// MARK: - UserInfo - FullName -
struct UserInfoFullName: Codable {
    var firstName: String?
    var lastName: String?
    
    func completionName() -> String {
        "\(wrappedFirstName) \(wrappedLastName)"
    }
    
    var wrappedFirstName: String {
        firstName ?? ""
    }
    var wrappedLastName: String {
        lastName ?? ""
    }
}

// MARK: - UserInfo - BirthDay -
struct UserInfoBirthDay: Codable {
    var year: Int?
    var month: Int?
    var day: Int?
    var clock = UserInfoBirthDayClock()
    
    func complationBirthDay() -> String {
        "\(wrappedDay).\(wrappedMonth).\(wrappedYear) Clock: \(clock.completionClock())"
    }
    
    var wrappedYear: Int {
        year ?? 0000
    }
    var wrappedMonth: Int {
        month ?? 00
    }
    var wrappedDay: Int {
        day ?? 00
    }
}
// MARK: - UserInfo - UserInfoBirthDayClock -
struct UserInfoBirthDayClock: Codable {
    var hour: Int?
    var minute: Int?
    
    func completionClock() -> String {
        "\(wrappedHour):\(wrappedMinute)"
    }
    
    var wrappedHour: Int {
        hour ?? 00
    }
    var wrappedMinute: Int {
        minute ?? 00
    }
}

// MARK: - UserInfo - Location -
struct UserInfoLocation: Codable {
    var cordinates = UserInfoLocationCoordinate()
    var country: String?
    var province: String?
    var district: String?
    
    func completionLocation() -> String {
        "\(wrappedCounty)/\(wrappedProvince)/\(wrappedDistrict) Cordinates: \(cordinates.completionCoordinates())"
    }
    
    var wrappedCounty: String {
        country ?? "NO Country"
    }
    var wrappedProvince: String {
        province ?? "No Province"
    }
    var wrappedDistrict: String {
        district ?? "No District"
    }
}

// MARK: - UserInfo - LocationCoordinate -
struct UserInfoLocationCoordinate: Codable {
    var longitude: Double?
    var latitude: Double?
    
    func completionCoordinates() -> String {
        "Longitude: \(wrappedLongitude) Latitude: \(wrappedLatitude)"
    }
    var wrappedLongitude: Double {
        longitude ?? 0.0
    }
    var wrappedLatitude: Double {
        latitude ?? 0.0
    }
}

// MARK: - User - UserSpiritual -
struct UserSpiritual: Codable {
    var zodiac: Int?
    var ascendant: Int?
    
    var wrappedZodiac: Int {
        zodiac ?? 0
    }
    var wrappedAscendant: Int {
        ascendant ?? 0
    }
}

// MARK: - User - UserSubscription -
struct UserOracle: Codable {
    var isOracled: Bool?
    var oracleMethod: String?
    var oraclePackage: String?
    var aicyCash: Int?
    
    var wrappedIsOracled: Bool {
        isOracled ?? false
    }
    var wrappedOracleMethod: String {
        oracleMethod ?? ""
    }
    var wrappedOraclePackage: String {
        oraclePackage ?? "None"
    }
    var wrappedAicyCash: Int {
        aicyCash ?? 0
    }
}

// MARK: - User - Aiachy Info -
struct AiachyInfo: Codable {
    var version: String?
    var theme: String?
    var language: String?
    var languageIdentifier: String?
    var aiachyDataInfo = AiachyDataInfo()
    var aiachyRemoteInfo = AiachyRemoteInfo()
    
    var wrappedVersion: String {
        version ?? ""
    }
    var wrappedTheme: String {
        theme ?? "Light"
    }
    var wrappedLanguage: String {
        language ?? "US"
    }
    var wrappedLanguageIdentifier: String {
        languageIdentifier ?? "en_US"
    }
}

struct AiachyDataInfo: Codable {
    var zodiacDataVersion: String?
    var tuneDataVersion: String?
    
    var wrappedZodiacDataVersion: String {
        zodiacDataVersion ?? ""
    }
    var wrappedTuneDataVersion: String {
        tuneDataVersion ?? ""
    }
}

struct AiachyRemoteInfo: Codable {
    var aiachyRemotedInfo: String?
    var isAiachyReady: Bool?
    
}

struct AiachyLove: Codable {
    
}

struct AiachyMystic: Codable {
    //FutureUpdate: 
}

struct AiachyGalaxy: Codable {
    
}

// MARK: - User - DeviceInfo -
struct DeviceInfo: Codable {
    var phoneWidth: Double?
    var phoneHeight: Double?
    var phoneModel: String?
    var phoneLanguage: String?
    var phoneSystem: String?
    var phoneVersion: String?
    
    var wrappedPhoneWidth: Double {
        phoneWidth ?? 0.0
    }
    var wrappedPhoneHeight: Double {
        phoneHeight ?? 0.0
    }
    var wrappedPhoneModel: String {
        phoneModel ?? ""
    }
    var wrappedPhoneLanguage: String {
        phoneLanguage ?? ""
    }
    var wrappedPhoneSystem: String {
        phoneSystem ?? ""
    }
    var wrappedPhoneVersion: String {
        phoneVersion ?? ""
    }
}

struct UserCompletion: Codable {
    //FutureUpdate: Models related to how many days the user has logged in or subscribed for will come.
}
