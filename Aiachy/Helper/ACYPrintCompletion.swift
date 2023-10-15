//
//  ACYPrintCompletion.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.05.2023.
//

import SwiftUI

typealias ACYPrintAppInfo = ACYPrintCompletion.AppInfoPrint
typealias ACYPrintUserAction = ACYPrintCompletion.UserActionPrint
typealias ACYPrintDataFetching = ACYPrintCompletion.DataFetchingPrint
typealias ACYPrintUserInfoWithLogin = ACYPrintCompletion.UserInfoPrintWithLogin
typealias ACYPrintUserDeviceInfo = ACYPrintCompletion.DeviceInfoPrint

struct ACYPrintCompletion {
    
    enum AppInfoPrint {
        case ethernetConnectionFound
        case ableToWriteToCoreData
        case ableToGetDataFromCoreData
        case ethernetCancalled
        case userLogout
        func printAppInfo() -> String {
            switch self {
            case .ethernetConnectionFound:
                return "AiachySystem: Ethernet connection is found"
            case .ableToWriteToCoreData:
                return "AiachySystem: The data from the server has been successfully written to the Core Data database."
            case .ableToGetDataFromCoreData:
                return "AiachySystem: Successfully retrieved data from core data database."
            case .ethernetCancalled:
                return "AiachySystem: Internet connection successfully disconnected."
            case .userLogout:
                return "AiachySystem: User successfully logout."
            }
        }
    }
    enum UserActionPrint {
        case userSuccessfullyLoggedIn
        case userMailNotUsedBefore
        func printUserInfo() -> String {
            switch self {
            case .userSuccessfullyLoggedIn:
                return "AiachySystem: User successfully logged in"
            case .userMailNotUsedBefore:
                return "AiachySystem: User successfully logged in with uniq mail"
            }
        }
    }
    enum DataFetchingPrint {
        case userFound
        case userFetched
        case dailyZodiacFetching
        case dailyZodiacFetched
        case zodiacDataVersionFetch
        case zodiacDataVersionSame
        case zodiacDataVersionUpdated
        func printDataFetching() -> String {
            switch self {
            case .userFound:
                return "AiachySystem: The user's information successful found on our servers."
            case .userFetched:
                return "AiachySystem: The user's information successful pulled from our servers."
            case .zodiacDataVersionFetch:
                return "AiachySystem: Zodiac data version is successful fected."
            case .dailyZodiacFetching:
                return "AiachySystem: Daily zodiac data current fetching from our servers."
            case .dailyZodiacFetched:
                return "AiachySystem: Daily zodiac data fetching progress completed."
            case .zodiacDataVersionSame:
                return "AiachySystem: Daily zodiac data version is no need updated."
            case .zodiacDataVersionUpdated:
                return "AiachySystem: Zodiac version updated"
            }
        }
    }
    enum UserLoginInfoPrint {
        case email
        case password
        case number
        case verification
        func printUserLoginInfo(_ T: AiachyState) -> String {
            let newT = T.user.userLoginInfo
            switch self {
            case .email:
                return "AiachySystem: User login info email is \(newT.wrappedEmail)"
            case .password:
                return "AiachySystem: User login info password is \(newT.wrappedPassowrd)"
            case .number:
                return "AiachySystem: User login info number is \(newT.number.makeUserPhone())"
            case .verification:
                return "AiachySystem: User login info email is verified \(newT.wrappedVerification)"
            }
        }
    }
    /// UserInfo Print
    enum UserInfoPrintWithLogin {
        case id
        case fullName
        case birthDay
        case location
        func printUserInfo(_ T: AiachyState) -> String {
            let newT = T.user.userInfo
            switch self {
            case .id:
                return "AiachySystem: User info id is \(newT.wrappedId)"
            case .fullName:
                return "AiachySystem: User info fullName is \(newT.fullName.completionName())"
            case .birthDay:
                return "AiachySystem: User info birthDay is \(newT.birthDay.complationBirthDay())"
            case .location:
                return "AiachySystem: User info location is \(newT.location.completionLocation())"
            }
        }
    }
    /// UserZodaic Print
    enum UserSpiritualPrint {
        case zodiac
        case ascendant
        func printUserZodiac(_ T: AiachyState) -> String {
            let newT = T.user.userSpiritual
            switch self {
            case .zodiac:
                return "AiachySystem: User zodiac is \(newT.wrappedZodiac)"
            case .ascendant:
                return "AiachySystem: User ascendant is \(newT.wrappedAscendant)"
            }
        }
    }
    /// User Subscription Print
    enum UserSubscriptionPrint {
        case isSubscriped
        case subscripedMethod
        func printUserSubscription(_ T: AiachyState) -> String {
            let newT = T.user.userOracle
            switch self {
            case .isSubscriped:
                return "AiachySystem: User is subscribe \(newT.wrappedIsOracled)"
            case .subscripedMethod:
                return "AiachySystem: User is subscribe method \(newT.wrappedOracleMethod)"
            }
        }
    }
    /// AiachyInfo Print
    enum AiachyInfoPrint {
        case version
        case zodiacDataVersion
        case theme
        func printAiachyInfo(_ T: AiachyState) -> String {
            let newT = T.user.aiachyInfo
            switch self {
            case .version:
                return "AiachyStytem: User Aiachy info version is \(newT.wrappedVersion)"
            case .zodiacDataVersion:
                return "AiachyStytem: User Aiachy info zodiac data version is \(newT.aiachyDataInfo.wrappedZodiacDataVersion)"
            case .theme:
                return "AiachyStytem: User Aiachy info is theme \(newT.wrappedTheme)"
            }
        }
    }
    /// UserData Print
    enum DeviceInfoPrint {
        case phoneWidth
        case phoneHeight
        case phoneModel
        case phoneLanguage
        case phoneSystem
        case phoneVersion
        func printDeviceInfo(_ T: AiachyState) -> String {
            let newT = T.user.deviceInfo
            switch self {
            case .phoneWidth:
                return "AiachySystem: User phone width is \(newT.wrappedPhoneWidth)"
            case .phoneHeight:
                return "AiachySystem: User phone height is \(newT.wrappedPhoneHeight)"
            case .phoneModel:
                return "AiachySystem: User phone model is \(newT.wrappedPhoneModel)"
            case .phoneLanguage:
                return "AiachySystem: User phone language is \(newT.wrappedPhoneLanguage)"
            case .phoneSystem:
                return "AiachySystem: User phone system is \(newT.wrappedPhoneSystem)"
            case .phoneVersion:
                return "AiachySystem: User phone version is \(newT.wrappedPhoneVersion)"
            }
        }
    }
}
