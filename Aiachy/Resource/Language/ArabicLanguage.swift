//
//  ArabicLanguage.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct ArabicLanguage {
    //MARK: - ArabicLanguage - textHelperGeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    let generalButton: [TextHelper.GeneralCompletion.button:String] = [
        .back: "رجوع",
        .continue: "استمر",
        .login: "تسجيل الدخول",
        .guest: "ضيف",
        .resetPassword: "نسيت كلمة المرور؟",
        .register: "ابدأ في مغامرة سحرية",
        .chooseLocation: "اختر موقعك",
        .preRegistration: "التسجيل المسبق",
        .logout: "تسجيل الخروج"
    ]
    let generalFlag: [textHelperGeneralCompletion.flag:String] = [
        .unitedArabEmirates: "الإمارات العربية المتحدة",
        .germany: "ألمانيا",
        .denmark: "الدنمارك",
        .france: "فرنسا",
        .unitedKingdom: "المملكة المتحدة",
        .greece: "اليونان",
        .italy: "إيطاليا",
        .poland: "بولندا",
        .romania: "رومانيا",
        .russianFederation: "الفدرالية الروسية",
        .türkiye: "تركيا",
        .ukraine: "أوكرانيا",
        .unitedStates: "الولايات المتحدة"
    ]
    //MARK: - ArabicLanguage - textHelperAlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    let alert: [textHelperAlertCompletion.alert:String] = [
        .notUserHaveConnection: "يرجى التأكد من اتصالك بالإنترنت",
        .notUserIsOlder: "يرجى إدخال عمرك. يجب أن تكون أكبر من 13 عامًا",
        .notUserHavePlace: "لم تقم بتحديد مكانك. يرجى تحديد مكانك",
        .areYouSure: "هل أنت متأكد؟",
        .appError: "خطأ في التطبيق",
        .needToRegister: "تحتاج إلى التسجيل",
        .notReady: "هذه الصفحة غير متوفرة في هذا الإصدار من التطبيق."
    ]
    let alertButton: [textHelperAlertCompletion.button:String] = [
        .tryAgain: "حاول مرة أخرى",
        .yes: "نعم",
        .no: "لا",
        .okey: "حسنًا"
    ]
    //MARK: - ArabicLanguage - TextFieldCompletion -
       typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
       let textField: [textHelperTextFieldCompletion.textField:String] = [
           .mailPhone: "البريد الإلكتروني/الهاتف",
           .password: "كلمة المرور",
           .againPassword: "أعد كلمة المرور",
           .phone: "الهاتف",
           .name: "الاسم",
           .surname: "اللقب",
           .mail: "البريد الإلكتروني",
           .place: "المكان"
       ]
       let textFieldError: [textHelperTextFieldCompletion.error:String] = [
           .emailWrong: "بريدك الإلكتروني غير صحيح",
           .passwordWrong: "كلمة المرور غير صحيحة",
           .nameNotFill: "يرجى ملء اسمك",
           .nameMinCharacter: "يجب أن يكون الاسم على الأقل من حرفين",
           .surnameMinCharacter: "يجب أن يكون اللقب على الأقل من حرفين",
           .surnameNotFill: "يرجى ملء لقبك",
           .mailNotFill: "يرجى ملء بريدك الإلكتروني",
           .passwordNotFill: "يرجى ملء كلمة المرور",
           .passwordAgainNotFill: "يرجى إعادة كلمة المرور",
           .passwordNotSame: "كلمات المرور غير متطابقة",
           .passwordMinCharacter: "يجب أن تكون كلمة المرور على الأقل من 6 أحرف",
           .mailCharactersWrong: "عنوان بريدك الإلكتروني غير متوافق",
           .phoneCharactersWrong: "هاتفك غير متوافق",
           .mailCantFound: "بريدك الإلكتروني غير صحيح",
           .phoneCantFound: "هاتفك غير صحيح",
           .passwordCantFound: "كلمة المرور غير صحيحة",
           .mailUsedBefore: "تم استخدام هذا البريد الإلكتروني من قبل"
       ]
    // MARK: -  ArabicLanguage - AuthCompletion -
     typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    let authTitle: [textHelperAuthCompletion.title:String] = [
        .loginScreenTitle: "كشف السحر، الرحلة في عالم Aiachy",
        .crystalSelectionTitle: "كشف الكريستال الغامض لميلادك",
        .registerTitle: "أطلق قوة برجك الفلكي",
        .ascendantSelectionTitle: "أضئ بريقك الداخلي",
        .attentionTitle: "انتباه",
    ]

    
    let authDescription: [textHelperAuthCompletion.description:String] = [
        .loginScreenDescription: "فك شفرات أسرار الإيثر، ادخل إلى الملجأ المقدس لـ Aiachy، وشاهد رقصة الأرواح السماوية!",
        .crystalSelectionDescription: "لقد حان الوقت لتعرف مستقبلك",
        .registerDescription: "ادخل إلى Aiachy لتجربة فلكية مُخصصة! دعنا نُخصص معلوماتك الفلكية بتفاصيلك السرية ونأخذك في رحلة فريدة",
        .ascendantSelectionDescription: "ابدأ رحلة تحويلية مع علامتك الصاعدة وأطلق القوة الداخلية",
        .ascendantSelectionViewGuideDescription: "حدد تاريخ ووقت الولادة",
        .attentionDescription: "التطبيق لا يزال لم يتم تسجيل الخروج منه بشكل كامل. من الطبيعي جدًا أن تواجه أخطاء. إذا واجهت وترغب في البحث عن حل. يمكنك إرسالها لنا بسرعة من قسم المساعدة. سيظهر التطبيق لأول وآخر مرة في هذا النوع بدعمك. لا تنسى أن تستمتع أثناء استخدام التطبيق",
        .attentionSecondDescription: "التحديث يأتي في الواحد والعشرين من كل شهر. تحقق من تويترنا"
    ]

    
    let authOnboarding: [textHelperAuthCompletion.onboarding:String] = [
        .heartofMysticTitle: "أنت في قلب الكون الصوفي",
        .secretOfTheStarsTitle: "كشف أسرار النجوم",
        .yourFutureTitle: "هل ترغب في معرفة مستقبلك",
        .heartofMysticDescription: "فتح الأبواب إلى عالم غامض يتيح لك التخطيط لمستقبلك بشكل أكثر فعالية",
        .secretOfTheStarsDescription: "وراء حجاب العالم المُميت، ارقص مع الهمسات الغامضة للنجوم، كشف ألغاز الكون المقدس",
        .yourFutureDescription: "سيوجهك Aiachy على مسار جميل ويظهر لك نصائح صغيرة عن مستقبلك",
    ]
    let authHelperAuth: [textHelperAuthCompletion.helperAuth:String] = [
        .clock: "الساعة",
        .privacyPolicy: "بإنشاء حساب، أنت توافق على سياسة الخصوصية وشروط الاستخدام الخاصة بنا."
    ]

    
    // MARK: -  ArabicLanguage - HomeCompletion -
       typealias textHelperHomeCompletion = TextHelper.HomeCompletion
       let home: [textHelperHomeCompletion.home:String] = [
           .aiachy: "أياشي",
           .compatibility: "التوافق",
           .notUsable: "غير متوفر. يجب عليك الاشتراك.",
           .notHaveAscendant: "تحتاج لاختيار العلامة الصاعدة."
       ]
       let homeDate: [textHelperHomeCompletion.date:String] = [
           .yesterday: "أمس",
           .today: "اليوم",
           .tomorrow: "غداً",
       ]
       let homeStatus: [textHelperHomeCompletion.status:String] = [
           .universe: "الكون",
           .enlightenment: "التنوير",
           .touch: "اللمس",
           .love: "الحب",
           .strength: "القوة",
           .creative: "الإبداع",
           .foundation: "الأساس"
       ]

       // MARK: - ArabicLanguage - LoveCompletion -
       typealias textHelperLoveCompletion = TextHelper.LoveCompletion
       let love: [textHelperLoveCompletion.love:String] = [
           .attentionTitle: "مستقبل الحب يكمن قليلاً أكثر، لذا كن صبوراً"
       ]

       // MARK: - ArabicLanguage - MysticCompletion -
       typealias textHelperMysticCompletion = TextHelper.MysticCompletion
       let mystic: [textHelperMysticCompletion.mystic:String] = [
           .tarotTitle: "التاروت",
           .palmistryTitle: "علم تفسير الكف",
           .crystalGazingTitle: "النظر في الكريستال",
           .tarotDescription: "غير متاح للاستخدام",
           .palmistyrDescription: "غير متاح للاستخدام",
           .crystalGazingDescription: "غير متاح للاستخدام"
       ]
        // MARK: - ArabicLanguage - GalaxyCompletion -
        typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
        let galaxy: [textHelperGalaxyCompletion.galaxy:String] = [
            .tuneTitle: "اللحن",
            .meditationTitle: "التأمل"
        ]
        let galaxyTune: [textHelperGalaxyCompletion.tune:String] = [
            .play: "تشغيل",
            .stop: "إيقاف",
            .clickToDownload: "انقر للتحميل",
            .downloading: "جارٍ التحميل"
        ]

        // MARK: - ArabicLanguage - SettingsCompletion -
        typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
        let settings: [textHelperSettingsCompletion.settings:String] = [
            .aicyCashTitle: "AicyCash",
            .oracleTitle: "المُعصب",
            .oracleHelper: "لا شيء",
            .languageTitle: "اللغة",
            .themeTitle: "المظهر",
            .themeLightHelper: "فاتح",
            .themeDarkHelper: "داكن"
        ]
        let settingsLanguage: [textHelperSettingsCompletion.language:String] = [
            .currentLanguage: "اللغة الحالية",
            .otherLanguage: "لغة أخرى"
        ]
    let settingsOracle: [textHelperSettingsCompletion.oracle: String] = [
        .packageZodiacTitle: "الفلكي",
        .packageZodiacItem1: "سيفيض خريطتك الفلكية بالحكمة الكونية، مما سيساعدك على فهم اتجاه حياتك بشكل أفضل.",
        .packageZodiacItem2: "ستفتح لك البطاقات الفلكية أبوابًا جديدة وتعزز من حدسك",
        .packageZodiacItem3: "سترفع الترددات الموسيقية الجديدة روحك وتفتح لك مشهدًا عاطفيًا جديدًا.",
        .packageOracleTitle: "المُعصب",
        .packageOracleItem1: "سيكون لديك وصول إلى ميزات جميع الحزم المتاحة، مما يجعلك مجهزًا جيدًا في كل المجالات.",
        .packageOracleItem2: "ستكون الميزات المبتكرة بين يديك، مما يعطيك خطوة قدمًا عن الجميع.",
        .packageOracleItem3: "اللطف الذي أظهرته سيترك بصمة دائمة على القلوب.",
        .packageOracleItem4: "ستكون هذه الحزمة أداة لا غنى عنها لرفع وتعزيز تطبيقك."
    ]
    // MARK: - ArabicLanguage - ZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    let crystalZodiac: [textHelperSpiritualCompletion.crystalName:String] = [
        .ariesCrystal: "عقيق",
        .taurusCrystal: "عين النمر",
        .geminiCrystal: "كوارتز وردي",
        .cancerCrystal: "لابرادوريت",
        .leoCrystal: "الياقوت الأحمر",
        .virgoCrystal: "حجر القمر",
        .libraCrystal: "لازورد",
        .scorpioCrystal: "تورمالين",
        .sagittariusCrystal: "أوبسيديان",
        .capricornCrystal: "كوارتز",
        .aquariusCrystal: "أكوامارين",
        .piscesCrystal: "لؤلؤ"
    ]

    let dateZodiac: [textHelperSpiritualCompletion.dateZodiac:String] = [
        .piscesZodiacDate: "20 فبراير - 20 مارس",
        .ariesZodiacDate: "21 مارس - 20 إبريل",
        .aquariusZodiacDate: "21 يناير - 19 فبراير",
        .geminiZodiacDate: "21 مايو - 21 يونيو",
        .libraZodiacDate: "24 سبتمبر - 23 أكتوبر",
        .virgoZodiacDate: "24 أغسطس - 23 سبتمبر",
        .capricornZodiacDate: "22 ديسمبر - 20 يناير",
        .sagittariusZodiacDate: "23 نوفمبر - 21 ديسمبر",
        .leoZodiacDate: "23 يوليو - 23 أغسطس",
        .scorpioZodiacDate: "24 أكتوبر - 22 نوفمبر",
        .taurusZodiacDate: "21 إبريل - 20 مايو",
        .cancerZodiacDate: "22 يونيو - 22 يوليو"
    ]
}

