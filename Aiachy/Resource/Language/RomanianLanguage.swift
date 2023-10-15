//
//  RomanianLanguage.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct RomanianLanguage {
    //MARK: - RomanianLanguage - textHelperGeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    let generalButton: [TextHelper.GeneralCompletion.button:String] = [
        .back: "Înapoi",
        .continue: "Continuă",
        .login: "Autentificare",
        .guest: "Oaspete",
        .resetPassword: "Ai uitat parola?",
        .register: "Porniți într-o aventură mistică",
        .chooseLocation: "Alegeți locația",
        .preRegistration: "Pre-înregistrare",
        .logout: "Deconectare"
    ]

    let generalFlag: [textHelperGeneralCompletion.flag:String] = [
        .unitedArabEmirates: "Emiratele Arabe Unite",
        .germany: "Germania",
        .denmark: "Danemarca",
        .france: "Franța",
        .unitedKingdom: "Regatul Unit",
        .greece: "Grecia",
        .italy: "Italia",
        .poland: "Polonia",
        .romania: "România",
        .russianFederation: "Federația Rusă",
        .türkiye: "Turcia",
        .ukraine: "Ucraina",
        .unitedStates: "Statele Unite ale Americii"
    ]

    //MARK: - RomaniaLanguage - textHelperAlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    let alert: [textHelperAlertCompletion.alert:String] = [
        .notUserHaveConnection: "Asigurați-vă că sunteți conectat la internet",
        .notUserIsOlder: "Vă rugăm să introduceți vârsta. Trebuie să aveți peste 13 ani",
        .notUserHavePlace: "Nu ați selectat locația. Vă rugăm să selectați locația",
        .areYouSure: "Ești sigur?",
        .appError: "Eroare de aplicație",
        .needToRegister: "Trebuie să vă înregistrați",
        .notReady: "Această pagină nu este pregătită în această versiune a aplicației."
    ]

    let alertButton: [textHelperAlertCompletion.button:String] = [
        .tryAgain: "Încearcă din nou",
        .yes: "Da",
        .no: "Nu",
        .okey: "Ok"
    ]

    //MARK: - RomaniaLanguage - TextFieldCompletion -
    typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
    let textField: [textHelperTextFieldCompletion.textField:String] = [
        .mailPhone: "E-mail/Telefon",
        .password: "Parolă",
        .againPassword: "Reintroduceți parola",
        .phone: "Telefon",
        .name: "Nume",
        .surname: "Prenume",
        .mail: "E-mail",
        .place: "Locație"
    ]

    let textFieldError: [textHelperTextFieldCompletion.error:String] = [
        .emailWrong: "E-mailul tău este incorect",
        .passwordWrong: "Parola ta este incorectă",
        .nameNotFill: "Vă rugăm să completați numele",
        .nameMinCharacter: "Numele trebuie să aibă minim 2 caractere",
        .surnameMinCharacter: "Prenumele trebuie să aibă minim 2 caractere",
        .surnameNotFill: "Vă rugăm să completați prenumele",
        .mailNotFill: "Vă rugăm să completați e-mailul",
        .passwordNotFill: "Vă rugăm să completați parola",
        .passwordAgainNotFill: "Vă rugăm să reintroduceți parola",
        .passwordNotSame: "Parolele nu se potrivesc",
        .passwordMinCharacter: "Parola trebuie să aibă minim 6 caractere",
        .mailCharactersWrong: "Adresa ta de e-mail nu este compatibilă",
        .phoneCharactersWrong: "Numărul tău de telefon nu este compatibil",
        .mailCantFound: "E-mailul tău este incorect",
        .phoneCantFound: "Numărul tău de telefon este incorect",
        .passwordCantFound: "Parola ta este incorectă",
        .mailUsedBefore: "Acest e-mail a fost folosit anterior"
    ]
    // MARK: - RomaniaLanguage - AuthCompletion -
    typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    let authTitle: [textHelperAuthCompletion.title:String] = [
        .loginScreenTitle: "Dezvăluie Magia, Călătorește în Regatul lui Aiachy",
        .crystalSelectionTitle: "Dezvăluie cristalul mistic al nașterii tale",
        .registerTitle: "Eliberează-ți Potențialul Zodiacal",
        .ascendantSelectionTitle: "Iluminează-ți Radiația Interioară",
        .attentionTitle: "ATENȚIE",
    ]
    
    let authDescription: [textHelperAuthCompletion.description:String] = [
        .loginScreenDescription: "Descifrează Misterul Eterului, Pășește în Sanctuarul Sacru al lui Aiachy și Martorizează Dansul Spiritelor Celeste!",
        .crystalSelectionDescription: "A venit timpul să afli viitorul tău",
        .registerDescription: "Pas în Aiachy pentru o experiență personalizată a horoscopului! Permite-ne să-ți personalizăm informațiile zodiacale cu detaliile tale confidențiale și să te ducem într-o călătorie unică",
        .ascendantSelectionDescription: "Începe o Călătorie Transformativă cu Semnul tău Ascendent și Eliberează Puterea din Interior",
        .ascendantSelectionViewGuideDescription: "Selectează data și ora nașterii",
        .attentionDescription: "Aplicația nu este încă complet deconectată. Este foarte normal să întâlnești erori. Dacă te confrunți și vrei să cauți o soluție. Ne poți trimite rapid din secțiunea Ajutor. Aplicația va apărea pentru prima și singura dată în acest gen cu sprijinul tău. Nu uita să te distrezi folosind aplicația",
        .attentionSecondDescription: "Actualizarea vine în data de 21 a fiecărei luni. Verificați Twitter-ul nostru"
    ]
    
    let authOnboarding: [textHelperAuthCompletion.onboarding:String] = [
        .heartofMysticTitle: "Ești în inima universului mistic",
        .secretOfTheStarsTitle: "Dezvăluie secretele stelelor",
        .yourFutureTitle: "Vrei să îți cunoști viitorul",
        .heartofMysticDescription: "Deblocarea ușilor către o lume mistică îți permite să îți planifici viitorul mai eficient",
        .secretOfTheStarsDescription: "Dincolo de Vălul Regatului Muritor, Dansează cu Șoaptele Mistice ale Stelelor, Dezlegând Enigmele Cosmosului Sacru",
        .yourFutureDescription: "Aiachy te va ghida pe un drum frumos și îți va arăta mici sfaturi despre viitorul tău",
    ]
    let authHelperAuth: [textHelperAuthCompletion.helperAuth:String] = [
        .clock: "Oră",
        .privacyPolicy: "Creând un cont, sunteți de acord cu Politica noastră de confidențialitate și Termenii de utilizare."
    ]

    // RomaniaLanguage - textHelperHomeCompletion -
    typealias textHelperHomeCompletion = TextHelper.HomeCompletion
    let home: [textHelperHomeCompletion.home:String] = [
        .aiachy: "Aiachy",
        .compatibility: "Compatibilitate",
        .notUsable: "Nu este disponibil. Trebuie să vă abonați.",
        .notHaveAscendant: "Trebuie să alegeți semnul ascendent."
    ]
    let homeDate: [textHelperHomeCompletion.date:String] = [
        .yesterday: "Ieri",
        .today: "Astăzi",
        .tomorrow: "Mâine"
    ]
    let homeStatus: [textHelperHomeCompletion.status:String] = [
        .universe: "Univers",
        .enlightenment: "Iluminare",
        .touch: "Atingere",
        .love: "Dragoste",
        .strength: "Forță",
        .creative: "Creativ",
        .foundation: "Fundament"
    ]

    // RomaniaLanguage - textHelperLoveCompletion -
    typealias textHelperLoveCompletion = TextHelper.LoveCompletion
    let love: [textHelperLoveCompletion.love:String] = [
        .attentionTitle: "Viitorul dragostei este doar puțin mai departe, așa că ai răbdare"
    ]

    // RomaniaLanguage - textHelperMysticCompletion -
    typealias textHelperMysticCompletion = TextHelper.MysticCompletion
    let mystic: [textHelperMysticCompletion.mystic:String] = [
        .tarotTitle: "Tarot",
        .palmistryTitle: "Chiromanție",
        .crystalGazingTitle: "Cristalomantie",
        .tarotDescription: "Nu este disponibil pentru utilizare",
        .palmistyrDescription: "Nu este disponibil pentru utilizare",
        .crystalGazingDescription: "Nu este disponibil pentru utilizare"
    ]

    // RomaniaLanguage - textHelperGalaxyCompletion -
    typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
    let galaxy: [textHelperGalaxyCompletion.galaxy:String] = [
        .tuneTitle: "Melodie",
        .meditationTitle: "Meditație"
    ]
    let galaxyTune: [textHelperGalaxyCompletion.tune:String] = [
        .play: "Redă",
        .stop: "Oprește",
        .clickToDownload: "Apasă pentru a descărca",
        .downloading: "Se descarcă"
    ]
    // RomaniaLanguage - textHelperSettingsCompletion -
    typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
    let settings: [textHelperSettingsCompletion.settings:String] = [
        .aicyCashTitle: "AicyCash",
        .oracleTitle: "Oracol",
        .oracleHelper: "Niciunul",
        .languageTitle: "Limbă",
        .themeTitle: "Temă",
        .themeLightHelper: "Luminos",
        .themeDarkHelper: "Întunecat",
    ]
    let settingsLanguage: [textHelperSettingsCompletion.language:String] = [
        .currentLanguage: "Limba curentă",
        .otherLanguage: "Altă limbă"
    ]
    let settingsOracle: [textHelperSettingsCompletion.oracle:String] = [
        .packageZodiacTitle: "Zodiac",
        .packageZodiacItem1: "Harta ta astrologică va fi plină de înțelepciune cosmică, ajutându-te să înțelegi mai bine direcția vieții tale.",
        .packageZodiacItem2: "Cărțile Tarot vor deschide uși noi pentru tine și vor întări intuiția ta",
        .packageZodiacItem3: "Frecvențe muzicale noi îți vor ridica sufletul și vor deschide noi peisaje emoționale pentru tine.",
        .packageOracleTitle: "Oracol",
        .packageOracleItem1: "Vei avea acces la caracteristicile tuturor pachetelor disponibile, făcându-te bine echipat în fiecare domeniu.",
        .packageOracleItem2: "Funcții inovatoare vor fi la îndemâna ta, oferindu-ți un pas înainte față de toată lumea.",
        .packageOracleItem3: "Amabilitatea pe care ai arătat-o va lăsa o amprentă eternă pe inimi.",
        .packageOracleItem4: "Acest pachet va fi un instrument indispensabil pentru a îmbunătăți și îmbogăți aplicația ta."
    ]

    // RomaniaLanguage - textHelperZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    let crystalZodiac: [textHelperSpiritualCompletion.crystalName:String] = [
        .ariesCrystal: "Ametist",
        .taurusCrystal: "Ochi de tigru",
        .geminiCrystal: "Cuarț roz",
        .cancerCrystal: "Labradorit",
        .leoCrystal: "Granat",
        .virgoCrystal: "Piatra lunii",
        .libraCrystal: "Lapis Lazuli",
        .scorpioCrystal: "Turmalină",
        .sagittariusCrystal: "Obsidian",
        .capricornCrystal: "Cuarț cristal",
        .aquariusCrystal: "Acvamarin",
        .piscesCrystal: "Perlă"
    ]

    let dateZodiac: [textHelperSpiritualCompletion.dateZodiac:String] = [
        .piscesZodiacDate: "20 feb - 20 mar",
        .ariesZodiacDate: "21 mar - 20 apr",
        .aquariusZodiacDate: "21 ian - 19 feb",
        .geminiZodiacDate: "21 mai - 21 iun",
        .libraZodiacDate: "24 sept - 23 oct",
        .virgoZodiacDate: "24 aug - 23 sept",
        .capricornZodiacDate: "22 dec - 20 ian",
        .sagittariusZodiacDate: "23 nov - 21 dec",
        .leoZodiacDate: "23 iul - 23 aug",
        .scorpioZodiacDate: "24 oct - 22 nov",
        .taurusZodiacDate: "21 apr - 20 mai",
        .cancerZodiacDate: "22 iun - 22 iul"
    ]
}
