//
//  TextHelper.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import Foundation

struct TextHelper {    
    //MARK: TextHelper - GeneralCompletion -
    struct GeneralCompletion {
        // GeneralCompletion - button
        enum button {
            case back
            case `continue`
            case login
            case guest
            case resetPassword
            case register
            case chooseLocation
            case preRegistration
            case logout
        }
        // GeneralCompletion - flag
        enum flag {
            case unitedArabEmirates
            case germany
            case denmark
            case france
            case unitedKingdom
            case greece
            case italy
            case poland
            case romania
            case russianFederation
            case türkiye
            case ukraine
            case unitedStates
        }
    }
    //MARK: TextHelper - AlertCompletion -
    struct AlertCompletion {
        // AlertCompletion - alert
        enum alert {
            case notUserHaveConnection
            case notUserIsOlder
            case notUserHavePlace
            case appError
            case areYouSure
            case needToRegister
            case notReady
        }
        // AlertCompletion - button
        enum button {
            case tryAgain
            case yes
            case no
            case okey
        }
    }
    //MARK: TextHelper - TextFieldCompletion -
    struct TextFieldCompletion {
        //TextFieldCompletion - Name
        enum textField {
            case mailPhone
            case password
            case againPassword
            case phone
            case main
            case name
            case surname
            case mail
            case place
            case resetPasswordPreference
        }
        //TextFieldCompletion - Error
        enum error {
            case emailWrong
            case passwordWrong
            case nameNotFill
            case nameMinCharacter
            case surnameMinCharacter
            case surnameNotFill
            case mailNotFill
            case passwordNotFill
            case passwordAgainNotFill
            case passwordNotSame
            case passwordMinCharacter
            case mailCharactersWrong
            case phoneCharactersWrong
            case mailCantFound
            case phoneCantFound
            case passwordCantFound
            case mailUsedBefore
        }
    }
    //MARK:  TextHelper - AuthCompletion -
    struct AuthCompletion {
        //NextPatchTODO: Make groub title & description
        // AuthCompletion - Title
        enum title {
            case loginScreenTitle
            case crystalSelectionTitle
            case registerTitle
            case ascendantSelectionTitle
            case attentionTitle
        }
        // AuthCompletion - Description
        enum description {
            case crystalSelectionDescription
            case loginScreenDescription
            case ascendantSelectionDescription
            case ascendantSelectionViewGuideDescription
            case registerDescription
            case attentionDescription
            case attentionSecondDescription
        }
        // AuthCompletion - Onboarding
        enum onboarding {
            case heartofMysticTitle
            case heartofMysticDescription
            case secretOfTheStarsTitle
            case secretOfTheStarsDescription
            case yourFutureTitle
            case yourFutureDescription
        }
        enum helperAuth {
            case clock
            case privacyPolicy
        }
    }
    //MARK: - TextHelper - HomeCompletion -
    struct HomeCompletion {
        // HomeCompletion - home
        enum home {
            case aiachy
            case compatibility
            case notUsable
            case notHaveAscendant
        }
        enum date {
            case yesterday
            case today
            case tomorrow
        }
        // HomeCompletion - status
        enum status {
            case universe
            case enlightenment
            case touch
            case love
            case strength
            case creative
            case foundation
        }
    }
    //MARK: - TextHelper - MysticCompletion -
    struct MysticCompletion {
        // MysticCompletion - Mystic
        enum mystic {
            case tarotTitle
            case tarotDescription
            case palmistryTitle
            case palmistyrDescription
            case crystalGazingTitle
            case crystalGazingDescription
        }
    }
    //MARK: - TextHelper - GalaxyCompletion -
    struct GalaxyCompletion {
        // GalaxyCompletion - Galaxy
        enum galaxy {
            case tuneTitle
            case meditationTitle
        }
        // GalaxyCompletion - Tune
        enum tune {
            case play
            case stop
            case clickToDownload
            case downloading
        }
    }
    //MARK: - TextHelper - LoveCompletion -
    struct LoveCompletion {
        // LoveCompletion - Love
        enum love {
            case attentionTitle
        }
    }
    //MARK: - TextHelper - SettingsCompletion -
    struct SettingsCompletion {
        // SettingsCompletion - Settings
        enum settings {
            case aicyCashTitle
            case oracleTitle
            case oracleHelper
            case languageTitle
            case themeTitle
            case themeLightHelper
            case themeDarkHelper
        }
        // SettingsCompletion - language
        enum language {
            case currentLanguage
            case otherLanguage
        }
        
        enum oracle {
            case packageZodiacTitle
            case packageZodiacItem1
            case packageZodiacItem2
            case packageZodiacItem3
            case packageZodiacPrice
            case packageOracleTitle
            case packageOracleItem1
            case packageOracleItem2
            case packageOracleItem3
            case packageOracleItem4
        }
    }
    // MARK: - TextHelper - ZodiacCompletion -
    struct SpiritualCompletion {
        enum crystalName {
            case ariesCrystal
            case taurusCrystal
            case geminiCrystal
            case cancerCrystal
            case leoCrystal
            case virgoCrystal
            case libraCrystal
            case scorpioCrystal
            case sagittariusCrystal
            case capricornCrystal
            case aquariusCrystal
            case piscesCrystal
        }
        // ZodiacCompletion - Zodiac
        enum dateZodiac {
            case piscesZodiacDate
            case ariesZodiacDate
            case aquariusZodiacDate
            case geminiZodiacDate
            case libraZodiacDate
            case virgoZodiacDate
            case capricornZodiacDate
            case sagittariusZodiacDate
            case leoZodiacDate
            case scorpioZodiacDate
            case taurusZodiacDate
            case cancerZodiacDate
        }
    }
}

