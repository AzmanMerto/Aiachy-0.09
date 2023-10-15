//
//  ACYErrorCompletion.swift
//  Aiachy
//
//  Created by Mert Türedü on 6.07.2023.
//

import Foundation

typealias ACYErrorAppInfo = ACYErrorCompletion.AppInfoErrorPrint
typealias ACYErrorUserInfo = ACYErrorCompletion.UserInfoErrorPrint
typealias ACYErrorDataFetching = ACYErrorCompletion.DataFetchingErrorPrint

struct ACYErrorCompletion {
    /// App Info Error
    enum AppInfoErrorPrint: Error {
        case ethernetConnectionNotFound
        case didntWriteToCoreData
        case didntGetFromCoreData
        case didntDeleteCoreData
        case unknownErrorOnCoreData
        func printAppInfo(_ viewName: String) -> String {
            switch self {
            case .ethernetConnectionNotFound:
                return "AiachySystemError view: \(viewName): Ethernet connection is not found."
            case .didntWriteToCoreData:
                return "AiachySystemError view: \(viewName): The data from the server could not be transferred to the Core Data database."
            case .didntGetFromCoreData:
                return "AiachySystemError view: \(viewName): Unfortunately, the data could not be retrieved from the core data database."
            case .didntDeleteCoreData:
                return "AiachySystemError view: \(viewName): Could not delete Core Data data."
            case .unknownErrorOnCoreData:
                return "AiachySystemError view: \(viewName): Cant be detected error."
            }
        }
    }
    /// User Info Error
    enum UserInfoErrorPrint: Error {
        case userCouldNotLoginSuccessfully
        case userCantCreateUser
        case userMailUsedBefore
        case userIdNotFound
        func printUserInfo(_ viewName: String) -> String {
            switch self {
            case .userCouldNotLoginSuccessfully:
                return "AiachySystemError view: \(viewName): Unfortunately, the user could not log in."
            case .userCantCreateUser:
                return "AiachySystemError view: \(viewName): User didnt created."
            case .userMailUsedBefore:
                return "AiachySystemError view: \(viewName): User mail before used."
            case .userIdNotFound:
                return "AiachySystemError view: \(viewName): User id not found."
            }
        }
    }
    /// Data fetching error
    enum DataFetchingErrorPrint: Error {
        case notFoundUser
        case cantFetchUser
        case cantFetcingZodiacData
        case cantFetchZodiacDataVersion
        case notSameZodiacDataVersion
        case notWorkingServer
        case willErrorZodiacDataVersion
        case noZodiacLeftToBring
        func printDataFetching(_ viewName: String) -> String {
            switch self {
            case .notFoundUser:
                return "AiachySystemError view: \(viewName): User not found on our servers."
            case .cantFetchUser:
                return "AiachySystemError view: \(viewName): The user's information could not be pulled from our servers."
            case .cantFetcingZodiacData:
                return "AiachySystemError view: \(viewName): The zodiac daily data information could not be pulled from our servers."
            case .cantFetchZodiacDataVersion:
                return "AiachySystemError view: \(viewName): The zodiac data version could not be fetch from our servers."
            case .notSameZodiacDataVersion:
                return "AiachySystemError view: \(viewName): Daily zodiac data version is not same need update."
            case .notWorkingServer:
                return "AiachySystemError view: \(viewName): Server not working."
            case .willErrorZodiacDataVersion:
                return "AiachySystemError view: \(viewName): An error may occur in the Zodiac data version.."
            case .noZodiacLeftToBring:
                return "AiachySystemError view: \(viewName): Server not working."
            }
        }
    }
}
