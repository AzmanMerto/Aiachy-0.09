//
//  EnglishLanguage.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct EnglishLanguage {
    
    //MARK: - EnglishLanguage - textHelperGeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    let generalButton: [TextHelper.GeneralCompletion.button:String] = [
        .back: "Back",
        .continue: "Continue",
        .login: "Login",
        .guest: "Guest",
        .resetPassword: "Forget your password ?",
        .register: "Embark on a Mystical Adventure",
        .chooseLocation: "Chose your location",
        .preRegistration: "Pre-registration",
        .logout: "Logout"
    ]
    
    let generalFlag: [textHelperGeneralCompletion.flag:String] = [
        .unitedArabEmirates: "United Arab Emirates",
        .germany: "Germany",
        .denmark: "Denmark",
        .france: "France",
        .unitedKingdom: "United Kingdom",
        .greece: "Greece",
        .italy: "Italy",
        .poland: "Poland",
        .romania: "Romania",
        .russianFederation: "Russian Federation",
        .türkiye: "Türkiye",
        .ukraine: "Ukraine",
        .unitedStates: "UnitedStates"
    ]
    //MARK: - EnglishLanguage - textHelperAlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    let alert: [textHelperAlertCompletion.alert:String] = [
        .notUserHaveConnection: "Please make sure you are connected to the internet",
        .notUserIsOlder: "Please enter your age. You have to older 13 years",
        .notUserHavePlace: "You have not selected your place. Please select your place",
        .areYouSure: "Are you sure ?",
        .appError: "App error",
        .needToRegister: "You need to register",
        .notReady: "This page is not available in this version of the application."
    ]
    let alertButton: [textHelperAlertCompletion.button:String] = [
        .tryAgain: "Try Again",
        .yes: "Yes",
        .no: "No",
        .okey: "Okey"
    ]
    //MARK: - EnglishLanguage - TextFieldCompletion -
    typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
    let textField: [textHelperTextFieldCompletion.textField:String] = [
        .mailPhone: "Mail/Phone",
        .password: "Password",
        .againPassword: "Again Password",
        .phone: "Phone",
        .name: "Name",
        .surname: "Surname",
        .mail: "Mail",
        .place: "Place"
    ]
    let textFieldError: [textHelperTextFieldCompletion.error:String] = [
        .emailWrong: "Your email is wrong",
        .passwordWrong: "Your password is wrong",
        .nameNotFill: "Please fill your name",
        .nameMinCharacter: "Name will be a minimum of 2 characters",
        .surnameMinCharacter: "Surname will be a minimum of 2 characters",
        .surnameNotFill: "Please fill your surname",
        .mailNotFill: "Please fill your mail",
        .passwordNotFill: "Please fill your password",
        .passwordAgainNotFill: "Please fill your passowrd again",
        .passwordNotSame: "Password not same",
        .passwordMinCharacter: "Password will be a minimum of 6 characters",
        .mailCharactersWrong: "Your e-mail address is not compatible",
        .phoneCharactersWrong: "Your phone is not compatible",
        .mailCantFound: "Your mail is incorrect",
        .phoneCantFound: "Your phone is incorrect",
        .passwordCantFound: "Your password is incorrect",
        .mailUsedBefore: "This email has been used before"
    ]
    // MARK: -  EnglishLanguage - AuthCompletion -
    typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    let authTitle: [textHelperAuthCompletion.title:String] = [
        .loginScreenTitle: "Unveil the Magic, Journey in Aiachy's Realm",
        .crystalSelectionTitle: "Unveil the mystic crystal of your birth.",
        .registerTitle: "Unleash Your Zodiac Potential",
        .ascendantSelectionTitle: "Illuminate Your Inner Radiance",
        .attentionTitle: "ATTENTION",
    ]
    
    let authDescription: [textHelperAuthCompletion.description:String] = [
        .loginScreenDescription: "Decipher the Mysteries of the Ether, Step into Aiachy's Sacred Sanctuary, and Witness the Dance of Celestial Spirits!",
        .crystalSelectionDescription: "The time has come to learn your future",
        .registerDescription: "Step into Aiachy for a personalized horoscope experience! Let us customize your zodiac information with your confidential details and take you on a unique journey",
        .ascendantSelectionDescription: "Embark on a Transformative Journey with Your Ascendant Sign Unleash the Power Within",
        .ascendantSelectionViewGuideDescription: "Select date and time of birth",
        .attentionDescription: "The application is still not fully logged out. It is very normal to encounter bugs. If you encounter and want to look for a solution. You can send it to us quickly from the Help section. The app will appear for the first and only time in this genre with your support. Don't forget to have fun while using the app",
        .attentionSecondDescription: "Update comes on 21st of every month Check Our Twitter"
    
    ]
    
    let authOnboarding: [textHelperAuthCompletion.onboarding:String] = [
        .heartofMysticTitle: "You are in the heart of mystic universal",
        .secretOfTheStarsTitle: "Unveil the Secrets of the Stars",
        .yourFutureTitle: "Do you want to know your future",
        .heartofMysticDescription: "Unlocking the doors to a mystical world allows you to plan your future more effectively",
        .secretOfTheStarsDescription: "Beyond the Veil of the Mortal Realm, Dance with the Mystical Whispers of the Stars, Unraveling the Enigmas of the Sacred Cosmos",
        .yourFutureDescription: "Aiachy will guide you on a beautiful path and show you little tips about your future",
    ]
    let authHelperAuth: [textHelperAuthCompletion.helperAuth:String] = [
        .clock: "Hour",
        .privacyPolicy: "By creating an account, you’re agree to our Privacy policy and Term of use."
    ]
    // MARK: -  EnglishLanguage - AuthCompletion -
    typealias textHelperHomeCompletion = TextHelper.HomeCompletion
    let home: [textHelperHomeCompletion.home:String] = [
        .aiachy:"aiachy",
        .compatibility:"Compatibility",
        .notUsable: "Not available. You have to subscribe.",
        .notHaveAscendant: "You need to choose the ascendant sign."
    ]
    let homeDate: [textHelperHomeCompletion.date:String] = [
        .yesterday:"Yesterday",
        .today:"Today",
        .tomorrow:"Tomorrow",
    ]
    let homeStatus: [textHelperHomeCompletion.status:String] = [
        .universe:"Universe",
        .enlightenment:"Enlightenment",
        .touch:"Touch",
        .love:"Love",
        .strength:"Strength",
        .creative:"Creative",
        .foundation:"Foundation"
    ]
    
    // MARK: - EnglishLanguage - LoveCompletion -
    typealias textHelperLoveCompletion = TextHelper.LoveCompletion
    let love: [textHelperLoveCompletion.love:String] = [
        .attentionTitle:"The future of love lies just a little further, so be patient"
    ]
    
    // MARK: - EnglishLanguage - MysticCompletion -
    typealias textHelperMysticCompletion = TextHelper.MysticCompletion
    let mystic: [textHelperMysticCompletion.mystic:String] = [
        .tarotTitle:"Tarot",
        .palmistryTitle:"Palmistry",
        .crystalGazingTitle:"Crystal Gazing",
        .tarotDescription:"Not available for use",
        .palmistyrDescription:"Not available for use",
        .crystalGazingDescription:"Not available for use"
    ]
    // MARK: - EnglishLanguage - GalaxyCompletion -
    typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
    let galaxy: [textHelperGalaxyCompletion.galaxy:String] = [
        .tuneTitle: "Tune",
        .meditationTitle: "Meditation"
    ]
    let galaxyTune: [textHelperGalaxyCompletion.tune:String] = [
        .play: "Play",
        .stop: "Stop",
        .clickToDownload: "Click To Download",
        .downloading: "Downloading"
    ]
    //MARK: - EnglishLanguage - SettingsCompletion -
    typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
    let settings: [textHelperSettingsCompletion.settings:String] = [
        .aicyCashTitle: "AicyCash",
        .oracleTitle: "Oracle",
        .oracleHelper: "None",
        .languageTitle: "Language",
        .themeTitle: "Theme",
        .themeLightHelper: "Light",
        .themeDarkHelper: "Dark",
    ]
    let settingsLanguage: [textHelperSettingsCompletion.language:String] = [
        .currentLanguage: "Current Language",
        .otherLanguage: "Other Language"
    ]
    let settingsOracle: [textHelperSettingsCompletion.oracle: String] = [
        .packageZodiacTitle: "Zodiac",
        .packageZodiacItem1: "Your astrological chart will overflow with cosmic wisdom, helping you better understand the direction of your life.",
        .packageZodiacItem2: "The Tarot cards will open new doors for you and strengthen your intuition",
        .packageZodiacItem3: "New musical frequencies will elevate your soul and open up new emotional landscapes for you.",
        .packageOracleTitle: "Oracle",
        .packageOracleItem1: "You will have access to the features of all available packages, making you well-equipped in every area.",
        .packageOracleItem2: "Innovative features will be at your fingertips, giving you a step ahead of everyone else.",
        .packageOracleItem3: "The kindness you've shown will leave an everlasting imprint on hearts.",
        .packageOracleItem4: "This package will be an indispensable tool to elevate and enhance your application."
        
    ]
    // MARK: - EnglishLanguage - ZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    let crystalZodiac: [textHelperSpiritualCompletion.crystalName:String] = [
        .ariesCrystal: "Ametista",
                .taurusCrystal: "Tigrisoculus",
                .geminiCrystal: "Rosequartz",
                .cancerCrystal: "Labradoritus",
                .leoCrystal: "Granatus",
                .virgoCrystal: "Lunapis",
                .libraCrystal: "Lapislazuli",
                .scorpioCrystal: "Tourmalinus",
                .sagittariusCrystal: "Obsidianus",
                .capricornCrystal: "Crystalquartz",
                .aquariusCrystal: "Aquamarius",
                .piscesCrystal: "Perna"
    ]
    let zodiac: [textHelperSpiritualCompletion.dateZodiac:String] = [
        .piscesZodiacDate: "20 Feb - 20 Mar",
        .ariesZodiacDate: "21 Mar - 20 Apr",
        .aquariusZodiacDate: "21 Jan - 19 Feb",
        .geminiZodiacDate: "21 May - 21 Jun",
        .libraZodiacDate: "24 Sept - 23 Oct",
        .virgoZodiacDate: "24 Aug - 23 Sept",
        .capricornZodiacDate: "22 Dec - 20 Jan",
        .sagittariusZodiacDate: "23 Nov - 21 Dec",
        .leoZodiacDate: "23 Jul - 23 Aug",
        .scorpioZodiacDate: "24 Oct - 22 Nov",
        .taurusZodiacDate: "21 Apr - 20 May",
        .cancerZodiacDate: "22 Jun - 22 Jul"
    ]
}
