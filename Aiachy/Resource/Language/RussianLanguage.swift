//
//  RussianLanguage.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct RussianLanguage {
    
    // MARK: - RussianLanguage - textHelperGeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    let generalButton: [textHelperGeneralCompletion.button:String] = [
        .back: "Назад",
        .continue: "Продолжить",
        .login: "Вход",
        .guest: "Гость",
        .resetPassword: "Забыли пароль?",
        .register: "Начать мистическое приключение",
        .chooseLocation: "Выберите ваше местоположение",
        .preRegistration: "Предварительная регистрация",
        .logout: "Выход"
    ]
    
    let generalFlag: [textHelperGeneralCompletion.flag:String] = [
        .unitedArabEmirates: "Объединенные Арабские Эмираты",
        .germany: "Германия",
        .denmark: "Дания",
        .france: "Франция",
        .unitedKingdom: "Великобритания",
        .greece: "Греция",
        .italy: "Италия",
        .poland: "Польша",
        .romania: "Румыния",
        .russianFederation: "Российская Федерация",
        .türkiye: "Турция",
        .ukraine: "Украина",
        .unitedStates: "Соединенные Штаты Америки"
    ]
    
    // MARK: - RussianLanguage - textHelperAlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    let alert: [textHelperAlertCompletion.alert:String] = [
        .notUserHaveConnection: "Пожалуйста, убедитесь, что вы подключены к интернету",
        .notUserIsOlder: "Пожалуйста, введите ваш возраст. Вам должно быть больше 13 лет",
        .notUserHavePlace: "Вы не выбрали ваше местоположение. Пожалуйста, выберите ваше местоположение",
        .areYouSure: "Вы уверены?",
        .appError: "Ошибка приложения",
        .needToRegister: "Вам необходимо зарегистрироваться",
        .notReady: "Эта страница не готова в этой версии приложения."
    ]
    let alertButton: [textHelperAlertCompletion.button:String] = [
        .tryAgain: "Попробовать снова",
        .yes: "Да",
        .no: "Нет",
        .okey: "Хорошо"
    ]
    
    // MARK: - RussianLanguage - textHelperTextFieldCompletion -
    typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
    let textField: [textHelperTextFieldCompletion.textField:String] = [
        .mailPhone: "Почта/Телефон",
        .password: "Пароль",
        .againPassword: "Пароль еще раз",
        .phone: "Телефон",
        .name: "Имя",
        .surname: "Фамилия",
        .mail: "Почта",
        .place: "Место"
    ]
    let textFieldError: [textHelperTextFieldCompletion.error:String] = [
        .emailWrong: "Ваша электронная почта неверна",
        .passwordWrong: "Ваш пароль неверен",
        .nameNotFill: "Пожалуйста, заполните ваше имя",
        .nameMinCharacter: "Имя должно быть минимум из 2 символов",
        .surnameMinCharacter: "Фамилия должна быть минимум из 2 символов",
        .surnameNotFill: "Пожалуйста, заполните вашу фамилию",
        .mailNotFill: "Пожалуйста, заполните вашу почту",
        .passwordNotFill: "Пожалуйста, заполните ваш пароль",
        .passwordAgainNotFill: "Пожалуйста, заполните ваш пароль еще раз",
        .passwordNotSame: "Пароли не совпадают",
        .passwordMinCharacter: "Пароль должен быть минимум из 6 символов",
        .mailCharactersWrong: "Ваш адрес электронной почты несовместим",
        .phoneCharactersWrong: "Ваш телефон несовместим",
        .mailCantFound: "Ваша почта неверна",
        .phoneCantFound: "Ваш телефон неверен",
        .passwordCantFound: "Ваш пароль неверен",
        .mailUsedBefore: "Эта электронная почта была использована ранее"
    ]
    
    // MARK: - RussianLanguage - AuthCompletion -
    typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    let authTitle: [textHelperAuthCompletion.title:String] = [
        .loginScreenTitle: "Раскройте Магию, Путешествие в Царстве Aiachy",
        .crystalSelectionTitle: "Раскройте мистический кристалл вашего рождения",
        .registerTitle: "Освободите ваше зодиакальное потенциал",
        .ascendantSelectionTitle: "Осветите Ваше Внутреннее Сияние",
        .attentionTitle: "ВНИМАНИЕ",
    ]

    let authDescription: [textHelperAuthCompletion.description:String] = [
        .loginScreenDescription: "Расшифруйте Тайны Эфира, Войдите в Священное Убежище Aiachy и Станьте Свидетелем Танца Небесных Духов!",
        .crystalSelectionDescription: "Пришло время узнать ваше будущее",
        .registerDescription: "Войдите в Aiachy для персонализированного гороскопа! Позвольте нам настроить вашу зодиакальную информацию с вашей конфиденциальной информацией и отправить вас в уникальное путешествие",
        .ascendantSelectionDescription: "Начните Трансформационное Путешествие со Знаком Вашего Восхождения и Освободите Внутреннюю Силу",
        .ascendantSelectionViewGuideDescription: "Выберите дату и время рождения",
        .attentionDescription: "Приложение еще не полностью вышло. Встреча с ошибками очень нормальна. Если вы столкнетесь и захотите искать решение. Вы можете быстро отправить его нам из раздела Помощь. Приложение появится впервые и единственный раз в этом жанре с вашей поддержкой. Не забудьте развлекаться, используя приложение",
        .attentionSecondDescription: "Обновление приходит 21-го числа каждого месяца. Проверьте Наш Twitter"
    ]
    
    let authOnboarding: [textHelperAuthCompletion.onboarding:String] = [
        .heartofMysticTitle: "Вы в сердце мистической вселенной",
        .secretOfTheStarsTitle: "Раскройте тайны звезд",
        .yourFutureTitle: "Хотите знать свое будущее",
        .heartofMysticDescription: "Открыв двери в мистический мир, вы сможете более эффективно планировать свое будущее",
        .secretOfTheStarsDescription: "За Покровом Смертного Царства, Танцуйте с Мистическими Шепотами Звезд, Раскрывая Тайны Священного Космоса",
        .yourFutureDescription: "Aiachy будет направлять вас по красивому пути и показывать маленькие советы о вашем будущем",
    ]
    let authHelperAuth: [textHelperAuthCompletion.helperAuth:String] = [
        .clock: "Час",
        .privacyPolicy: "Создавая учетную запись, вы соглашаетесь с нашей Политикой конфиденциальности и Условиями использования."
    ]
    
    // MARK: - RussianLanguage - textHelperHomeCompletion -
    typealias textHelperHomeCompletion = TextHelper.HomeCompletion
    let home: [textHelperHomeCompletion.home:String] = [
        .aiachy: "Айачи",
        .compatibility: "Совместимость",
        .notUsable: "Недоступно. Вам нужно подписаться.",
        .notHaveAscendant: "Вам нужно выбрать восходящий знак."
    ]
    let homeDate: [textHelperHomeCompletion.date:String] = [
        .yesterday: "Вчера",
        .today: "Сегодня",
        .tomorrow: "Завтра"
    ]
    let homeStatus: [textHelperHomeCompletion.status:String] = [
        .universe: "Вселенная",
        .enlightenment: "Прозрение",
        .touch: "Прикосновение",
        .love: "Любовь",
        .strength: "Сила",
        .creative: "Творчество",
        .foundation: "Основание"
    ]
    
    // MARK: - RussianLanguage - LoveCompletion -
    typealias textHelperLoveCompletion = TextHelper.LoveCompletion
    let love: [textHelperLoveCompletion.love:String] = [
        .attentionTitle: "Будущее любви лежит всего лишь немного дальше, будьте терпеливы"
    ]
    
    // MARK: - RussianLanguage - MysticCompletion -
    typealias textHelperMysticCompletion = TextHelper.MysticCompletion
    let mystic: [textHelperMysticCompletion.mystic:String] = [
        .tarotTitle: "Таро",
        .palmistryTitle: "Хиромантия",
        .crystalGazingTitle: "Кристалломантия",
        .tarotDescription: "Недоступно для использования",
        .palmistyrDescription: "Недоступно для использования",
        .crystalGazingDescription: "Недоступно для использования"
    ]
    
    // MARK: - RussianLanguage - GalaxyCompletion -
    typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
    let galaxy: [textHelperGalaxyCompletion.galaxy:String] = [
        .tuneTitle: "Мелодия",
        .meditationTitle: "Медитация"
    ]
    let galaxyTune: [textHelperGalaxyCompletion.tune:String] = [
        .play: "Играть",
        .stop: "Остановить",
        .clickToDownload: "Нажмите для скачивания",
        .downloading: "Загрузка"
    ]
    
    // MARK: - RussianLanguage - SettingsCompletion -
    typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
    let settings: [textHelperSettingsCompletion.settings:String] = [
        .aicyCashTitle: "AicyCash",
        .oracleTitle: "Оракул",
        .oracleHelper: "Нет",
        .languageTitle: "Язык",
        .themeTitle: "Тема",
        .themeLightHelper: "Светлая",
        .themeDarkHelper: "Темная"
    ]
    let settingsLanguage: [textHelperSettingsCompletion.language:String] = [
        .currentLanguage: "Текущий язык",
        .otherLanguage: "Другой язык"
    ]
    let settingsOracle: [textHelperSettingsCompletion.oracle:String] = [
        .packageZodiacTitle: "Зодиак",
        .packageZodiacItem1: "Ваш астрологический график будет переполнен космической мудростью, помогая вам лучше понимать направление вашей жизни.",
        .packageZodiacItem2: "Карты Таро откроют перед вами новые двери и укрепят вашу интуицию",
        .packageZodiacItem3: "Новые музыкальные частоты поднимут вашу душу и откроют перед вами новые эмоциональные пейзажи.",
        .packageOracleTitle: "Оракул",
        .packageOracleItem1: "У вас будет доступ ко всем доступным функциям пакетов, что сделает вас хорошо подготовленным в каждой области.",
        .packageOracleItem2: "Инновационные функции будут у вас под рукой, давая вам шаг впереди всех остальных.",
        .packageOracleItem3: "Доброта, которую вы проявили, оставит вечный след на сердцах.",
        .packageOracleItem4: "Этот пакет станет неотъемлемым инструментом для повышения и улучшения вашего приложения."
    ]
    
    // MARK: - RussianLanguage - ZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    let crystalZodiac: [textHelperSpiritualCompletion.crystalName:String] = [
        .ariesCrystal: "Аметист",
        .taurusCrystal: "Тигровый глаз",
        .geminiCrystal: "Розовый кварц",
        .cancerCrystal: "Лабрадорит",
        .leoCrystal: "Гранат",
        .virgoCrystal: "Лунный камень",
        .libraCrystal: "Лазурит",
        .scorpioCrystal: "Турмалин",
        .sagittariusCrystal: "Обсидиан",
        .capricornCrystal: "Горный хрусталь",
        .aquariusCrystal: "Аквамарин",
        .piscesCrystal: "Жемчуг"
    ]

    let dateZodiac: [textHelperSpiritualCompletion.dateZodiac:String] = [
        .piscesZodiacDate: "20 фев - 20 мар",
        .ariesZodiacDate: "21 мар - 20 апр",
        .aquariusZodiacDate: "21 янв - 19 фев",
        .geminiZodiacDate: "21 май - 21 июн",
        .libraZodiacDate: "24 сен - 23 окт",
        .virgoZodiacDate: "24 авг - 23 сен",
        .capricornZodiacDate: "22 дек - 20 янв",
        .sagittariusZodiacDate: "23 ноя - 21 дек",
        .leoZodiacDate: "23 июл - 23 авг",
        .scorpioZodiacDate: "24 окт - 22 ноя",
        .taurusZodiacDate: "21 апр - 20 май",
        .cancerZodiacDate: "22 июн - 22 июл"
    ]
}

