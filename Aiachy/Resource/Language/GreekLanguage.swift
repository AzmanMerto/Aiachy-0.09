//
//  GreekLanguage.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct GreekLanguage {
    // MARK: - GreekLanguage - GeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    let generalButton: [TextHelper.GeneralCompletion.button:String] = [
        .back: "Πίσω",
        .continue: "Συνέχεια",
        .login: "Σύνδεση",
        .guest: "Επισκέπτης",
        .resetPassword: "Ξεχάσατε τον κωδικό σας;",
        .register: "Ξεκινήστε μια μυστική περιπέτεια",
        .chooseLocation: "Επιλέξτε την τοποθεσία σας",
        .preRegistration: "Προεγγραφή",
        .logout: "Αποσύνδεση"
    ]

    let generalFlag: [textHelperGeneralCompletion.flag:String] = [
        .unitedArabEmirates: "Ηνωμένα Αραβικά Εμιράτα",
        .germany: "Γερμανία",
        .denmark: "Δανία",
        .france: "Γαλλία",
        .unitedKingdom: "Ηνωμένο Βασίλειο",
        .greece: "Ελλάδα",
        .italy: "Ιταλία",
        .poland: "Πολωνία",
        .romania: "Ρουμανία",
        .russianFederation: "Ρωσική Ομοσπονδία",
        .türkiye: "Τουρκία",
        .ukraine: "Ουκρανία",
        .unitedStates: "Ηνωμένες Πολιτείες"
    ]

    // MARK: - GreekLanguage - AlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    let alert: [textHelperAlertCompletion.alert:String] = [
        .notUserHaveConnection: "Βεβαιωθείτε ότι είστε συνδεδεμένοι στο διαδίκτυο",
        .notUserIsOlder: "Παρακαλούμε εισάγετε την ηλικία σας. Πρέπει να είστε άνω των 13 ετών",
        .notUserHavePlace: "Δεν έχετε επιλέξει τοποθεσία. Επιλέξτε την τοποθεσία σας",
        .areYouSure: "Είστε σίγουροι;",
        .appError: "Σφάλμα εφαρμογής",
        .needToRegister: "Πρέπει να εγγραφείτε",
        .notReady: "Αυτή η σελίδα δεν είναι έτοιμη σε αυτήν την έκδοση της εφαρμογής."
    ]

    let alertButton: [textHelperAlertCompletion.button:String] = [
        .tryAgain: "Δοκιμάστε ξανά",
        .yes: "Ναι",
        .no: "Όχι",
        .okey: "Εντάξει"
    ]

    // MARK: - GreekLanguage - TextFieldCompletion -
    typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
    let textField: [textHelperTextFieldCompletion.textField:String] = [
        .mailPhone: "Mail/Τηλέφωνο",
        .password: "Κωδικός",
        .againPassword: "Κωδικός ξανά",
        .phone: "Τηλέφωνο",
        .name: "Όνομα",
        .surname: "Επίθετο",
        .mail: "Mail",
        .place: "Τοποθεσία"
    ]

    // MARK: - GreekLanguage - TextFieldErrorCompletion -
    let textFieldError: [textHelperTextFieldCompletion.error:String] = [
        .emailWrong: "Το email σας είναι λάθος",
        .passwordWrong: "Ο κωδικός σας είναι λάθος",
        .nameNotFill: "Παρακαλούμε συμπληρώστε το όνομά σας",
        .nameMinCharacter: "Το όνομα πρέπει να έχει τουλάχιστον 2 χαρακτήρες",
        .surnameMinCharacter: "Το επίθετο πρέπει να έχει τουλάχιστον 2 χαρακτήρες",
        .surnameNotFill: "Παρακαλούμε συμπληρώστε το επίθετό σας",
        .mailNotFill: "Παρακαλούμε συμπληρώστε το email σας",
        .passwordNotFill: "Παρακαλούμε συμπληρώστε τον κωδικό σας",
        .passwordAgainNotFill: "Παρακαλούμε συμπληρώστε τον κωδικό σας ξανά",
        .passwordNotSame: "Οι κωδικοί δεν ταιριάζουν",
        .passwordMinCharacter: "Ο κωδικός πρέπει να έχει τουλάχιστον 6 χαρακτήρες",
        .mailCharactersWrong: "Η διεύθυνση email σας δεν είναι συμβατή",
        .phoneCharactersWrong: "Ο αριθμός τηλεφώνου σας δεν είναι συμβατός",
        .mailCantFound: "Το email σας είναι λανθασμένο",
        .phoneCantFound: "Ο αριθμός τηλεφώνου σας είναι λανθασμένος",
        .passwordCantFound: "Ο κωδικός σας είναι λανθασμένος",
        .mailUsedBefore: "Αυτή η διεύθυνση email έχει ήδη χρησιμοποιηθεί"
    ]
    // MARK: - GreekLanguage - AuthCompletion -
    typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    let authTitle: [textHelperAuthCompletion.title:String] = [
        .loginScreenTitle: "Αποκαλύψτε τη Μαγεία, Ταξιδέψτε στο Βασίλειο του Aiachy",
        .crystalSelectionTitle: "Αποκαλύψτε το μυστηριώδες κρύσταλλο της γέννησής σας",
        .registerTitle: "Απελευθερώστε το Δυναμικό του Ζωδιακού σας",
        .ascendantSelectionTitle: "Φωτίστε την Εσωτερική σας Λάμψη",
        .attentionTitle: "ΠΡΟΣΟΧΗ",
    ]
    
    let authDescription: [textHelperAuthCompletion.description:String] = [
        .loginScreenDescription: "Αποκρυπτογραφήστε τα Μυστήρια του Αιθέρα, Βαδίστε στο Ιερό Καταφύγιο του Aiachy και Παρακολουθήστε τον Χορό των Ουράνιων Πνευμάτων!",
        .crystalSelectionDescription: "Ήρθε η ώρα να μάθετε το μέλλον σας",
        .registerDescription: "Βαδίστε στο Aiachy για μια προσαρμοσμένη εμπειρία ζωδιακού! Επιτρέψτε μας να προσαρμόσουμε τις πληροφορίες σας με τα εμπιστευτικά σας στοιχεία και να σας πάρουμε σε ένα μοναδικό ταξίδι",
        .ascendantSelectionDescription: "Ξεκινήστε ένα Μετασχηματιστικό Ταξίδι με το Αναδυόμενο Σας Σημάδι και Απελευθερώστε την Εσωτερική Δύναμη",
        .ascendantSelectionViewGuideDescription: "Επιλέξτε ημερομηνία και ώρα γέννησης",
        .attentionDescription: "Η εφαρμογή δεν έχει αποσυνδεθεί ακόμη πλήρως. Είναι πολύ φυσιολογικό να αντιμετωπίζετε σφάλματα. Εάν αντιμετωπίσετε και θέλετε να ψάξετε για μια λύση. Μπορείτε να το στείλετε γρήγορα σε εμάς από το τμήμα Βοήθειας. Η εφαρμογή θα εμφανιστεί για πρώτη και μοναδική φορά σε αυτό το είδος με την υποστήριξή σας. Μην ξεχάσετε να διασκεδάσετε χρησιμοποιώντας την εφαρμογή",
        .attentionSecondDescription: "Η ενημέρωση έρχεται στις 21 του κάθε μήνα. Ελέγξτε το Twitter μας"
    ]
    
    let authOnboarding: [textHelperAuthCompletion.onboarding:String] = [
        .heartofMysticTitle: "Είσαι στην καρδιά του μυστικού σύμπαντος",
        .secretOfTheStarsTitle: "Αποκαλύψτε τα Μυστικά των Αστέρων",
        .yourFutureTitle: "Θέλετε να γνωρίσετε το μέλλον σας;",
        .heartofMysticDescription: "Ξεκλειδώνοντας τις πόρτες σε έναν μυστικό κόσμο σας επιτρέπει να σχεδιάσετε το μέλλον σας πιο αποτελεσματικά",
        .secretOfTheStarsDescription: "Πέρα από το Πέπλο του Θνητού Βασιλείου, Χορεύτε με τους Μυστικιστικούς Ψιθύρους των Αστέρων, Ξετυλίγοντας τα Αινίγματα του Ιερού Κόσμου",
        .yourFutureDescription: "Η Aiachy θα σας οδηγήσει σε έναν όμορφο δρόμο και θα σας δείξει μικρές συμβουλές για το μέλλον σας",
    ]

    let authHelperAuth: [textHelperAuthCompletion.helperAuth:String] = [
        .clock: "Ώρα",
        .privacyPolicy: "Δημιουργώντας έναν λογαριασμό, συμφωνείτε με την Πολιτική Απορρήτου και τους Όρους Χρήσης μας."
    ]
    // MARK: - GreekLanguage - HomeCompletion -
    typealias textHelperHomeCompletion = TextHelper.HomeCompletion
    let home: [textHelperHomeCompletion.home:String] = [
        .aiachy:"Αιαχυ",
        .compatibility: "Συμβατότητα",
        .notUsable: "Δεν είναι διαθέσιμο. Πρέπει να εγγραφείτε.",
        .notHaveAscendant: "Χρειάζεστε να επιλέξετε τον άνοδο."
    ]
    let homeDate: [textHelperHomeCompletion.date:String] = [
        .yesterday: "Χθες",
        .today: "Σήμερα",
        .tomorrow: "Αύριο",
    ]
    let homeStatus: [textHelperHomeCompletion.status:String] = [
        .universe: "Σύμπαν",
        .enlightenment: "Ενημέρωση",
        .touch: "Αφή",
        .love: "Αγάπη",
        .strength: "Δύναμη",
        .creative: "Δημιουργικότητα",
        .foundation: "Θεμέλιο"
    ]

    // MARK: - GreekLanguage - LoveCompletion -
    typealias textHelperLoveCompletion = TextHelper.LoveCompletion
    let love: [textHelperLoveCompletion.love:String] = [
        .attentionTitle: "Το μέλλον της αγάπης βρίσκεται λίγο πιο μακριά, οπότε να έχετε υπομονή"
    ]

    // MARK: - GreekLanguage - MysticCompletion -
    typealias textHelperMysticCompletion = TextHelper.MysticCompletion
    let mystic: [textHelperMysticCompletion.mystic:String] = [
        .tarotTitle: "Ταρώ",
        .palmistryTitle: "Χειρομαντεία",
        .crystalGazingTitle: "Κρυσταλλομαντεία",
        .tarotDescription: "Δεν είναι διαθέσιμο για χρήση",
        .palmistyrDescription: "Δεν είναι διαθέσιμο για χρήση",
        .crystalGazingDescription: "Δεν είναι διαθέσιμο για χρήση"
    ]

    // MARK: - GreekLanguage - GalaxyCompletion -
    typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
    let galaxy: [textHelperGalaxyCompletion.galaxy:String] = [
        .tuneTitle: "Τραγούδι",
        .meditationTitle: "Διαλογισμός"
    ]
    let galaxyTune: [textHelperGalaxyCompletion.tune:String] = [
        .play: "Παίξτε",
        .stop: "Σταματήστε",
        .clickToDownload: "Κάντε κλικ για λήψη",
        .downloading: "Λήψη"
    ]

    // MARK: - GreekLanguage - SettingsCompletion -
    typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
    let settings: [textHelperSettingsCompletion.settings:String] = [
        .aicyCashTitle: "AicyCash",
        .oracleTitle: "Οράκουλο",
        .oracleHelper: "Κανένα",
        .languageTitle: "Γλώσσα",
        .themeTitle: "Θέμα",
        .themeLightHelper: "Φως",
        .themeDarkHelper: "Σκοτάδι"
    ]
    let settingsLanguage: [textHelperSettingsCompletion.language:String] = [
        .currentLanguage: "Τρέχουσα Γλώσσα",
        .otherLanguage: "Άλλη Γλώσσα"
    ]
    let settingsOracle: [textHelperSettingsCompletion.oracle: String] = [
        .packageZodiacTitle: "Ζώδιο",
        .packageZodiacItem1: "Ο αστρολογικός σας χάρτης θα πλημμυρίσει με κοσμική σοφία, βοηθώντας σας να κατανοήσετε καλύτερα την κατεύθυνση της ζωής σας.",
        .packageZodiacItem2: "Οι κάρτες Ταρώ θα ανοίξουν νέες πόρτες για εσάς και θα ενισχύσουν τη διαίσθησή σας",
        .packageZodiacItem3: "Νέες μουσικές συχνότητες θα ανυψώσουν την ψυχή σας και θα ανοίξουν νέα συναισθηματικά τοπία για εσάς.",
        .packageOracleTitle: "Οράκουλο",
        .packageOracleItem1: "Θα έχετε πρόσβαση στις λειτουργίες όλων των διαθέσιμων πακέτων, καθιστώντας σας καλά εξοπλισμένους σε κάθε τομέα.",
        .packageOracleItem2: "Καινοτόμα χαρακτηριστικά θα είναι στα δάχτυλά σας, δίνοντάς σας ένα βήμα μπροστά από όλους τους άλλους.",
        .packageOracleItem3: "Η καλοσύνη που έχετε δείξει θα αφήσει ένα αιώνιο αποτύπωμα στις καρδιές.",
        .packageOracleItem4: "Αυτό το πακέτο θα είναι ένα απαραίτητο εργαλείο για την ανύψωση και τη βελτίωση της εφαρμογής σας."
    ]
    // MARK: - GreekLanguage - ZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    let crystalZodiac: [textHelperSpiritualCompletion.crystalName:String] = [
        .ariesCrystal: "Αμέθυστος",
        .taurusCrystal: "Μάτι τίγρης",
        .geminiCrystal: "Ροζ Κουαρτζ",
        .cancerCrystal: "Λαμπραδόριτης",
        .leoCrystal: "Γρανάτης",
        .virgoCrystal: "Λίθος της σελήνης",
        .libraCrystal: "Λάπις λαζουλί",
        .scorpioCrystal: "Τουρμαλίνη",
        .sagittariusCrystal: "Οψιδιανός",
        .capricornCrystal: "Κρυστάλλινο κουαρτζ",
        .aquariusCrystal: "Ακουαμαρίνα",
        .piscesCrystal: "Πέρλα"
    ]

    let dateZodiac: [textHelperSpiritualCompletion.dateZodiac:String] = [
        .piscesZodiacDate: "20 Φεβ - 20 Μαρ",
        .ariesZodiacDate: "21 Μαρ - 20 Απρ",
        .aquariusZodiacDate: "21 Ιαν - 19 Φεβ",
        .geminiZodiacDate: "21 Μαϊ - 21 Ιουν",
        .libraZodiacDate: "24 Σεπ - 23 Οκτ",
        .virgoZodiacDate: "24 Αυγ - 23 Σεπ",
        .capricornZodiacDate: "22 Δεκ - 20 Ιαν",
        .sagittariusZodiacDate: "23 Νοε - 21 Δεκ",
        .leoZodiacDate: "23 Ιουλ - 23 Αυγ",
        .scorpioZodiacDate: "24 Οκτ - 22 Νοε",
        .taurusZodiacDate: "21 Απρ - 20 Μαϊ",
        .cancerZodiacDate: "22 Ιουν - 22 Ιουλ"
    ]

}
