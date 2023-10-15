//
//  ACYConstants.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.05.2023.
//

import SwiftUI

//MARK: Constants - UserDefaults Key
let ACYUserDefaults = UserDefaults.standard
let ACYThemeKey = "AiachyTheme"
let ACYUserID = "UserID"
//MARK: Constants - Times
let ACY_MIN_TIME: Double = 0.1
let ACY_MED_TIME: Double = 0.5
let ACY_LNG_TIME: Double = 1.0
let ACY_LRG_TIME: Double = 2.0
let ACY_MAX_TIME: CGFloat = 3
let ACY_GRADE_TIME: Double = 4
//MARK: Constants - Size
let ACY_MIKRO_SIZE: Double = 0.04
let ACY_MAKRO_SIZE: Double = 0.05
let ACY_ALTMIN_SIZE: Double = 0.06
let ACY_MIN_SIZE: Double = 0.07
let ACY_UPMIN_SIZE: Double = 0.11
let ACY_ALTSML_SIZE: Double = 0.15
let ACY_SML_SIZE: Double = 0.2
let ACY_UPSML_SIZE: Double = 0.23
let ACY_ALTMED_SIZE: Double = 0.25
let ACY_MED_SIZE: Double = 0.35
let ACY_UPMED_SIZE: Double = 0.45
let ACY_LNG_SIZE: Double = 0.6
let ACY_LRG_SIZE: Double = 0.7
let ACY_MAX_SIZE: Double = 0.8
let ACY_FULL_SIZE: Double = 1
let ACY_UI_WIDTH_SIZE = UIScreen.main.bounds.width
let ACY_UI_HEIGHT_SIZE = UIScreen.main.bounds.height
//MARK: Constant - for previews
let ACY_PREVIEWS_STATE = AiachyState(user:User(userSpiritual: UserSpiritual(zodiac: 0,
                                                                          ascendant: 0),
                                             aiachyInfo: AiachyInfo(theme: "Light",
                                                                    language: "US"),
                                             deviceInfo: DeviceInfo(phoneWidth: ACY_UI_WIDTH_SIZE,
                                                                    phoneHeight: ACY_UI_HEIGHT_SIZE)))
//MARK: Constant - firebase collection
let ACY_USERS_COLLECTION: String = "users"

let ACY_ZODIAC_TR_COLLECTION: String = "zodiac TR"
let ACY_COMPATIBILITY_TR_COLLECTION: String = "compatibility TR"
let ACY_ASCENDIANT_TR_COLLECTION: String = "ascendiant TR"
let ACY_STATUS_TR_COLLECTION: String = "status TR"

let ACY_EXECUTIVE_COLLECTION: String = "executive"
let ACY_GALAXY_COLLECTION: String = "galaxy"
let ACY_TUNE_COLLECTION: String = "tune"

let ACY_DATA_INFO_PATH: String = "aiachyDataInfo"

let ACY_ZODIAC_ENTITY_YESTERDAY: ACYUserAllEntity = ACYUserAllEntity(zodiac: ACYZodiacEntity(date: "10.02.2032",
                                                                                             zodiac: 0,
                                                                                             serialNumber: 00,
                                                                                             comment: "313131",
                                                                                             zodiacDataVersion: "0.0.1"),
                                                                     ascendiant: ACY_ASCENDIANT_ENTITY_YESTERDAY,
                                                                     compatibility: ACY_COMPATIBILITY_ENTITY_YESTERDAY,
                                                                     chakraStatus: ACY_STATUS_ENTITY_YESTERDAY)

let ACY_ZODIAC_ENTITY_TODAY: ACYUserAllEntity = ACYUserAllEntity(zodiac: ACYZodiacEntity(date: "10.02.2032",
                                                                                         zodiac: 0,
                                                                                         serialNumber: 00,
                                                                                         comment: "313131",
                                                                                         zodiacDataVersion: "0.0.1"),
                                                                 ascendiant: ACY_ASCENDIANT_ENTITY_TODAY,
                                                                 compatibility: ACY_COMPATIBILITY_ENTITY_TODAY,
                                                                 chakraStatus: ACY_CHAKRA_STATUS_ENTITY_TODAY)

let ACY_ZODIAC_ENTITY_TOMORROW: ACYUserAllEntity = ACYUserAllEntity(zodiac: ACYZodiacEntity(date: "10.02.2032",
                                                                                            zodiac: 0,
                                                                                            serialNumber: 00,
                                                                                            comment: "313131",
                                                                                            zodiacDataVersion: "0.0.1"),
                                                                    ascendiant: ACY_ASCENDIANT_ENTITY_TOMORROW,
                                                                    compatibility: ACY_COMPATIBILITY_ENTITY_TOMORROW,
                                                                    chakraStatus: ACY_STATUS_ENTITY_TOMORROW)

let ACY_STATUS_ENTITY_YESTERDAY: [ACYChakraStatusEntity] = [
    ACYChakraStatusEntity(serialNumber: 00, tier: 0, rate: 0.3, comment: "YESTERDAY Status Descrpiption", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 1, rate: 0.3, comment: "YESTERDAY Status Descrpiption", statusDataVersion: "0.0.1" ),
    ACYChakraStatusEntity(serialNumber: 00, tier: 2, rate: 0.3, comment: "YESTERDAY Status Descrpiption", statusDataVersion: "0.0.1" ),
    ACYChakraStatusEntity(serialNumber: 00, tier: 3, rate: 0.3, comment: "YESTERDAY Status Descrpiption", statusDataVersion: "0.0.1" ),
    ACYChakraStatusEntity(serialNumber: 00, tier: 4, rate: 0.3, comment: "YESTERDAY Status Descrpiption", statusDataVersion: "0.0.1" ),
    ACYChakraStatusEntity(serialNumber: 00, tier: 5, rate: 0.3, comment: "YESTERDAY Status Descrpiption", statusDataVersion: "0.0.1" ),
    ACYChakraStatusEntity(serialNumber: 00, tier: 6, rate: 0.3, comment: "YESTERDAY Status Descrpiption", statusDataVersion: "0.0.1")
    ]

let ACY_CHAKRA_STATUS_ENTITY_TODAY: [ACYChakraStatusEntity] = [
    ACYChakraStatusEntity(serialNumber: 00, tier: 0, rate: 0.3, comment: "TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 TODAY Status Descrpiption0 ", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 1, rate: 0.3, comment: "TODAY Status Descrpiption1", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 2, rate: 0.3, comment: "TODAY Status Descrpiption2", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 3, rate: 0.3, comment: "TODAY Status Descrpiption3", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 4, rate: 0.3, comment: "TODAY Status Descrpiption4", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 5, rate: 0.3, comment: "TODAY Status Descrpiption5", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 6, rate: 0.3, comment: "TODAY Status Descrpiption6", statusDataVersion: "0.0.1")
    ]

let ACY_STATUS_ENTITY_TOMORROW: [ACYChakraStatusEntity] = [
    ACYChakraStatusEntity(serialNumber: 00, tier: 0, rate: 0.3, comment: "TOMORROW Status Descrpiption", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 1, rate: 0.3, comment: "TOMORROW Status Descrpiption", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 2, rate: 0.3, comment: "TOMORROW Status Descrpiption", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 3, rate: 0.3, comment: "TOMORROW Status Descrpiption", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 4, rate: 0.3, comment: "TOMORROW Status Descrpiption", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 5, rate: 0.3, comment: "TOMORROW Status Descrpiption", statusDataVersion: "0.0.1"),
    ACYChakraStatusEntity(serialNumber: 00, tier: 6, rate: 0.3, comment: "TOMORROW Status Descrpiption", statusDataVersion: "0.0.1")
    ]

let ACY_ASCENDIANT_ENTITY_YESTERDAY : [ACYAscendiantEntity] = [ 
    ACYAscendiantEntity(serialNumber: 00, determinedZodiac: 0, comment: "Yesterday ascendiant comment", ascendiantDataVersion: "0.0.1") 
]

let ACY_ASCENDIANT_ENTITY_TODAY : [ACYAscendiantEntity] = [ 
    ACYAscendiantEntity(serialNumber: 00, determinedZodiac: 0, comment: "Today ascendiant comment", ascendiantDataVersion: "0.0.1")
]

let ACY_ASCENDIANT_ENTITY_TOMORROW : [ACYAscendiantEntity] = [ 
    ACYAscendiantEntity(serialNumber: 00, determinedZodiac: 0, comment: "Tomorrow ascendiant comment", ascendiantDataVersion: "0.0.1")
]


let ACY_COMPATIBILITY_ENTITY_YESTERDAY: [ACYCompatibilityEntity] = [
ACYCompatibilityEntity(serialNumber: 00, zodiac: 0, compatibilityDataVersion: "0.0.1"),
ACYCompatibilityEntity(serialNumber: 00, zodiac: 1, compatibilityDataVersion: "0.0.1")
]

let ACY_COMPATIBILITY_ENTITY_TODAY: [ACYCompatibilityEntity] = [
ACYCompatibilityEntity(serialNumber: 00, zodiac: 2, compatibilityDataVersion: "0.0.1"),
ACYCompatibilityEntity(serialNumber: 00, zodiac: 3, compatibilityDataVersion: "0.0.1")
]


let ACY_COMPATIBILITY_ENTITY_TOMORROW: [ACYCompatibilityEntity] = [
ACYCompatibilityEntity(serialNumber: 00, zodiac: 4, compatibilityDataVersion: "0.0.1"),
ACYCompatibilityEntity(serialNumber: 00, zodiac: 5, compatibilityDataVersion: "0.0.1")
]
