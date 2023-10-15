//
//  UkrainianLanguage.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct UkrainianLanguage {
    
    // MARK: - UkrainianLanguage - textHelperGeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    let generalButton: [textHelperGeneralCompletion.button:String] = [
        .back: "Назад",
        .continue: "Продовжити",
        .login: "Увійти",
        .guest: "Гість",
        .resetPassword: "Забули пароль?",
        .register: "Почніть містичну пригоду",
        .chooseLocation: "Оберіть ваше місцезнаходження",
        .preRegistration: "Попередня реєстрація",
        .logout: "Вийти"
    ]
    
    let generalFlag: [textHelperGeneralCompletion.flag:String] = [
        .unitedArabEmirates: "Об'єднані Арабські Емірати",
        .germany: "Німеччина",
        .denmark: "Данія",
        .france: "Франція",
        .unitedKingdom: "Сполучене Королівство",
        .greece: "Греція",
        .italy: "Італія",
        .poland: "Польща",
        .romania: "Румунія",
        .russianFederation: "Російська Федерація",
        .türkiye: "Туреччина",
        .ukraine: "Україна",
        .unitedStates: "Сполучені Штати"
    ]
    
    // MARK: - UkrainianLanguage - textHelperAlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    let alert: [textHelperAlertCompletion.alert:String] = [
        .notUserHaveConnection: "Будь ласка, переконайтеся, що ви підключені до Інтернету",
        .notUserIsOlder: "Будь ласка, введіть ваш вік. Вам повинно бути більше 13 років",
        .notUserHavePlace: "Ви не обрали ваше місце. Будь ласка, виберіть ваше місце",
        .areYouSure: "Ви впевнені?",
        .appError: "Помилка додатку",
        .needToRegister: "Вам потрібно зареєструватися",
        .notReady: "Ця сторінка недоступна в цій версії програми."
    ]
    let alertButton: [textHelperAlertCompletion.button:String] = [
        .tryAgain: "Спробувати знову",
        .yes: "Так",
        .no: "Ні",
        .okey: "Добре"
    ]
    
    // MARK: - UkrainianLanguage - TextFieldCompletion -
    typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
    let textField: [textHelperTextFieldCompletion.textField:String] = [
        .mailPhone: "Пошта/Телефон",
        .password: "Пароль",
        .againPassword: "Пароль знову",
        .phone: "Телефон",
        .name: "Ім'я",
        .surname: "Прізвище",
        .mail: "Пошта",
        .place: "Місце"
    ]
    let textFieldError: [textHelperTextFieldCompletion.error:String] = [
        .emailWrong: "Ваша електронна адреса неправильна",
        .passwordWrong: "Ваш пароль неправильний",
        .nameNotFill: "Будь ласка, заповніть ваше ім'я",
        .nameMinCharacter: "Ім'я повинно мати мінімум 2 символи",
        .surnameMinCharacter: "Прізвище повинно мати мінімум 2 символи",
        .surnameNotFill: "Будь ласка, заповніть ваше прізвище",
        .mailNotFill: "Будь ласка, заповніть вашу пошту",
        .passwordNotFill: "Будь ласка, заповніть ваш пароль",
        .passwordAgainNotFill: "Будь ласка, заповніть ваш пароль знову",
        .passwordNotSame: "Паролі не співпадають",
        .passwordMinCharacter: "Пароль повинен мати мінімум 6 символів",
        .mailCharactersWrong: "Ваша електронна адреса несумісна",
        .phoneCharactersWrong: "Ваш телефон несумісний",
        .mailCantFound: "Ваша пошта неправильна",
        .phoneCantFound: "Ваш телефон неправильний",
        .passwordCantFound: "Ваш пароль неправильний",
        .mailUsedBefore: "Цю електронну адресу вже використовували"
    ]
    
    // MARK: - UkrainianLanguage - AuthCompletion -
    typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    let authTitle: [textHelperAuthCompletion.title:String] = [
        .loginScreenTitle: "Відкрийте Магію, Подорожуйте у Царстві Aiachy",
        .crystalSelectionTitle: "Відкрийте містичний кристал вашого народження",
        .registerTitle: "Відкрийте свій зодіакальний потенціал",
        .ascendantSelectionTitle: "Освітліть ваше внутрішнє сяйво",
        .attentionTitle: "УВАГА",
    ]
    
    let authDescription: [textHelperAuthCompletion.description:String] = [
        .loginScreenDescription: "Розшифруйте Таємниці Ефіру, Увійдіть до Святого Притулку Aiachy та Станьте Свідком Танцю Небесних Духів!",
        .crystalSelectionDescription: "Настала пора дізнатися про ваше майбутнє",
        .registerDescription: "Увійдіть до Aiachy для персоналізованого гороскопу! Дозвольте нам налаштувати вашу зодіакальну інформацію з вашою конфіденційною інформацією та взяти вас в унікальну подорож",
        .ascendantSelectionDescription: "Розпочніть Трансформаційну Подорож з Вашим Знаком Підйому та Вивільніть Внутрішню Силу",
        .ascendantSelectionViewGuideDescription: "Виберіть дату та час народження",
        .attentionDescription: "Додаток ще не повністю вийшов. Зустріч з помилками дуже нормальна. Якщо ви зіткнетеся і захочете шукати рішення. Ви можете швидко надіслати його нам з розділу Допомога. Додаток з'явиться вперше і єдиний раз в цьому жанрі з вашою підтримкою. Не забудьте розважатися, використовуючи додаток",
        .attentionSecondDescription: "Оновлення приходить 21-го числа кожного місяця. Перевірте Наш Twitter"
    ]
    
    let authOnboarding: [textHelperAuthCompletion.onboarding:String] = [
        .heartofMysticTitle: "Ви в серці містичного всесвіту",
        .secretOfTheStarsTitle: "Відкрийте таємниці зірок",
        .yourFutureTitle: "Хочете знати своє майбутнє?",
        .heartofMysticDescription: "Відкриваючи двері до містичного світу, ви можете ефективніше планувати своє майбутнє",
        .secretOfTheStarsDescription: "За Завісою Смертного Царства, Танцюйте з Містичними Шепотами Зірок, Розгадуючи Загадки Святого Космосу",
        .yourFutureDescription: "Aiachy направить вас на прекрасний шлях і покаже вам маленькі поради щодо вашого майбутнього",
    ]
    let authHelperAuth: [textHelperAuthCompletion.helperAuth:String] = [
        .clock: "Година",
        .privacyPolicy: "Створюючи обліковий запис, ви погоджуєтеся з нашою Політикою конфіденційності та Умовами використання."
    ]
    
    // MARK: - UkrainianLanguage - HomeCompletion -
    typealias textHelperHomeCompletion = TextHelper.HomeCompletion
    let home: [textHelperHomeCompletion.home:String] = [
        .aiachy: "Айачі",
        .compatibility: "Сумісність",
        .notUsable: "Не доступно. Вам потрібно підписатися.",
        .notHaveAscendant: "Вам потрібно вибрати восходячий знак."
    ]
    let homeDate: [textHelperHomeCompletion.date:String] = [
        .yesterday: "Вчора",
        .today: "Сьогодні",
        .tomorrow: "Завтра"
    ]
    let homeStatus: [textHelperHomeCompletion.status:String] = [
        .universe: "Всесвіт",
        .enlightenment: "Проосвітлення",
        .touch: "Дотик",
        .love: "Любов",
        .strength: "Сила",
        .creative: "Творчість",
        .foundation: "Фундація"
    ]
    
    // MARK: - UkrainianLanguage - LoveCompletion -
    typealias textHelperLoveCompletion = TextHelper.LoveCompletion
    let love: [textHelperLoveCompletion.love:String] = [
        .attentionTitle: "Майбутнє кохання лежить трохи далі, будьте терплячі"
    ]
    
    // MARK: - UkrainianLanguage - MysticCompletion -
    typealias textHelperMysticCompletion = TextHelper.MysticCompletion
    let mystic: [textHelperMysticCompletion.mystic:String] = [
        .tarotTitle: "Таро",
        .palmistryTitle: "Хіромантія",
        .crystalGazingTitle: "Кришталеве дивування",
        .tarotDescription: "Не доступно для використання",
        .palmistyrDescription: "Не доступно для використання",
        .crystalGazingDescription: "Не доступно для використання"
    ]
    
    // MARK: - UkrainianLanguage - GalaxyCompletion -
    typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
    let galaxy: [textHelperGalaxyCompletion.galaxy:String] = [
        .tuneTitle: "Мелодія",
        .meditationTitle: "Медитація"
    ]
    let galaxyTune: [textHelperGalaxyCompletion.tune:String] = [
        .play: "Грати",
        .stop: "Зупинити",
        .clickToDownload: "Натисніть, щоб завантажити",
        .downloading: "Завантаження"
    ]
    
    // MARK: - UkrainianLanguage - SettingsCompletion -
    typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
    let settings: [textHelperSettingsCompletion.settings:String] = [
        .aicyCashTitle: "AicyCash",
        .oracleTitle: "Оракул",
        .oracleHelper: "Немає",
        .languageTitle: "Мова",
        .themeTitle: "Тема",
        .themeLightHelper: "Світла",
        .themeDarkHelper: "Темна"
    ]
    let settingsLanguage: [textHelperSettingsCompletion.language:String] = [
        .currentLanguage: "Поточна мова",
        .otherLanguage: "Інша мова"
    ]
    let settingsOracle: [textHelperSettingsCompletion.oracle: String] = [
        .packageZodiacTitle: "Зодіак",
        .packageZodiacItem1: "Ваш астрологічний графік буде переповнений космічною мудрістю, допомагаючи вам краще розуміти напрямок вашого життя.",
        .packageZodiacItem2: "Карти Таро відкриють для вас нові двері та зміцнять вашу інтуїцію",
        .packageZodiacItem3: "Нові музичні частоти піднімуть вашу душу та відкриють для вас нові емоційні ландшафти.",
        .packageOracleTitle: "Оракул",
        .packageOracleItem1: "У вас буде доступ до функцій усіх доступних пакетів, роблячи вас добре оснащеним у кожній області.",
        .packageOracleItem2: "Інноваційні функції будуть у вас на піддоспі, даючи вам крок впереди всіх інших.",
        .packageOracleItem3: "Доброта, яку ви показали, залишить вічний відбиток на серцях.",
        .packageOracleItem4: "Цей пакет буде невід'ємним інструментом для підняття та покращення вашого додатку."
    ]
    
    // MARK: - UkrainianLanguage - ZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    let crystalZodiac: [textHelperSpiritualCompletion.crystalName:String] = [
        .ariesCrystal: "Аметист",
        .taurusCrystal: "Тигрове око",
        .geminiCrystal: "Рожевий кварц",
        .cancerCrystal: "Лабрадорит",
        .leoCrystal: "Гранат",
        .virgoCrystal: "Місячний камінь",
        .libraCrystal: "Лазурит",
        .scorpioCrystal: "Турмалін",
        .sagittariusCrystal: "Обсидіан",
        .capricornCrystal: "Гірський кристал",
        .aquariusCrystal: "Аквамарин",
        .piscesCrystal: "Перла"
    ]

    let dateZodiac: [textHelperSpiritualCompletion.dateZodiac:String] = [
        .piscesZodiacDate: "20 лютого - 20 березня",
        .ariesZodiacDate: "21 березня - 20 квітня",
        .aquariusZodiacDate: "21 січня - 19 лютого",
        .geminiZodiacDate: "21 травня - 21 червня",
        .libraZodiacDate: "24 вересня - 23 жовтня",
        .virgoZodiacDate: "24 серпня - 23 вересня",
        .capricornZodiacDate: "22 грудня - 20 січня",
        .sagittariusZodiacDate: "23 листопада - 21 грудня",
        .leoZodiacDate: "23 липня - 23 серпня",
        .scorpioZodiacDate: "24 жовтня - 22 листопада",
        .taurusZodiacDate: "21 квітня - 20 травня",
        .cancerZodiacDate: "22 червня - 22 липня"
    ]
}

