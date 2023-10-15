//
//  FrenchLanguage.swift
//  Aiachy
//
//  Created by Mert Türedü on 23.08.2023.
//

import Foundation

struct FrenchLanguage {
    
    //MARK: - FrenchLanguage - textHelperGeneralCompletion -
    typealias textHelperGeneralCompletion = TextHelper.GeneralCompletion
    let generalButton: [textHelperGeneralCompletion.button:String] = [
        .back: "Retour",
        .continue: "Continuer",
        .login: "Connexion",
        .guest: "Invité",
        .resetPassword: "Mot de passe oublié ?",
        .register: "Embarquez dans une aventure mystique",
        .chooseLocation: "Choisissez votre emplacement",
        .preRegistration: "Pré-inscription",
        .logout: "Déconnexion"
    ]
    
    let generalFlag: [textHelperGeneralCompletion.flag:String] = [
        .unitedArabEmirates: "Émirats arabes unis",
        .germany: "Allemagne",
        .denmark: "Danemark",
        .france: "France",
        .unitedKingdom: "Royaume-Uni",
        .greece: "Grèce",
        .italy: "Italie",
        .poland: "Pologne",
        .romania: "Roumanie",
        .russianFederation: "Fédération de Russie",
        .türkiye: "Turquie",
        .ukraine: "Ukraine",
        .unitedStates: "États-Unis"
    ]
    
    //MARK: - FrenchLanguage - textHelperAlertCompletion -
    typealias textHelperAlertCompletion = TextHelper.AlertCompletion
    let alert: [textHelperAlertCompletion.alert:String] = [
        .notUserHaveConnection: "Assurez-vous d'être connecté à Internet",
        .notUserIsOlder: "Veuillez entrer votre âge. Vous devez avoir plus de 13 ans",
        .notUserHavePlace: "Vous n'avez pas sélectionné votre lieu. Veuillez choisir votre lieu",
        .areYouSure: "Êtes-vous sûr ?",
        .appError: "Erreur de l'application",
        .needToRegister: "Vous devez vous inscrire",
        .notReady: "Cette page n'est pas disponible dans cette version de l'application."
    ]
    let alertButton: [textHelperAlertCompletion.button:String] = [
        .tryAgain: "Réessayer",
        .yes: "Oui",
        .no: "Non",
        .okey: "D'accord"
    ]
    
    //MARK: - FrenchLanguage - TextFieldCompletion -
    typealias textHelperTextFieldCompletion = TextHelper.TextFieldCompletion
    let textField: [textHelperTextFieldCompletion.textField:String] = [
        .mailPhone: "Mail/Téléphone",
        .password: "Mot de passe",
        .againPassword: "Confirmer le mot de passe",
        .phone: "Téléphone",
        .name: "Prénom",
        .surname: "Nom",
        .mail: "Mail",
        .place: "Lieu"
    ]
    let textFieldError: [textHelperTextFieldCompletion.error:String] = [
        .emailWrong: "Votre email est incorrect",
        .passwordWrong: "Votre mot de passe est incorrect",
        .nameNotFill: "Veuillez remplir votre prénom",
        .nameMinCharacter: "Le prénom doit comporter au minimum 2 caractères",
        .surnameMinCharacter: "Le nom doit comporter au minimum 2 caractères",
        .surnameNotFill: "Veuillez remplir votre nom",
        .mailNotFill: "Veuillez remplir votre mail",
        .passwordNotFill: "Veuillez remplir votre mot de passe",
        .passwordAgainNotFill: "Veuillez confirmer votre mot de passe",
        .passwordNotSame: "Les mots de passe ne correspondent pas",
        .passwordMinCharacter: "Le mot de passe doit comporter au moins 6 caractères",
        .mailCharactersWrong: "Votre adresse e-mail n'est pas compatible",
        .phoneCharactersWrong: "Votre téléphone n'est pas compatible",
        .mailCantFound: "Votre mail est incorrect",
        .phoneCantFound: "Votre téléphone est incorrect",
        .passwordCantFound: "Votre mot de passe est incorrect",
        .mailUsedBefore: "Cet email a déjà été utilisé"
    ]
    
    //MARK: - FrenchLanguage - AuthCompletion -
    typealias textHelperAuthCompletion = TextHelper.AuthCompletion
    let authTitle: [textHelperAuthCompletion.title:String] = [
        .loginScreenTitle: "Révélez la Magie, Voyagez dans le Royaume d'Aiachy",
        .crystalSelectionTitle: "Révélez le cristal mystique de votre naissance",
        .registerTitle: "Libérez Votre Potentiel Zodiacal",
        .ascendantSelectionTitle: "Illuminez Votre Radiance Intérieure",
        .attentionTitle: "ATTENTION",
    ]

    
    let authDescription: [textHelperAuthCompletion.description:String] = [
        .loginScreenDescription: "Déchiffrez les Mystères de l'Éther, Entrez dans le Sanctuaire Sacré d'Aiachy, et Soyez Témoin de la Danse des Esprits Célestes!",
        .crystalSelectionDescription: "Le temps est venu de connaître votre avenir",
        .registerDescription: "Entrez dans Aiachy pour une expérience d'horoscope personnalisée! Laissez-nous personnaliser vos informations zodiacales avec vos détails confidentiels et vous emmener dans un voyage unique",
        .ascendantSelectionDescription: "Embarquez pour un Voyage Transformateur avec Votre Signe Ascendant et Libérez la Puissance Intérieure",
        .ascendantSelectionViewGuideDescription: "Sélectionnez la date et l'heure de naissance",
        .attentionDescription: "L'application n'est toujours pas complètement déconnectée. Il est très normal de rencontrer des bugs. Si vous en rencontrez et souhaitez chercher une solution. Vous pouvez nous l'envoyer rapidement depuis la section Aide. L'application apparaîtra pour la première et unique fois dans ce genre avec votre soutien. N'oubliez pas de vous amuser en utilisant l'application",
        .attentionSecondDescription: "La mise à jour arrive le 21 de chaque mois. Consultez Notre Twitter"
    ]

    
    let authOnboarding: [textHelperAuthCompletion.onboarding:String] = [
        .heartofMysticTitle: "Vous êtes au cœur de l'univers mystique",
        .secretOfTheStarsTitle: "Levez le voile sur les secrets des étoiles",
        .yourFutureTitle: "Voulez-vous connaître votre avenir",
        .heartofMysticDescription: "Ouvrir les portes à un monde mystique vous permet de planifier votre avenir plus efficacement",
        .secretOfTheStarsDescription: "Au-delà du Voile du Royaume Mortel, Dansez avec les Murmures Mystiques des Étoiles, Démêlant les Énigmes du Cosmos Sacré",
        .yourFutureDescription: "Aiachy vous guidera sur un beau chemin et vous montrera des petits conseils sur votre avenir",
    ]
    let authHelperAuth: [textHelperAuthCompletion.helperAuth:String] = [
        .clock: "Heure",
        .privacyPolicy: "En créant un compte, vous acceptez notre politique de confidentialité et nos conditions d'utilisation."
    ]
    
    //MARK: - FrenchLanguage - HomeCompletion -
    typealias textHelperHomeCompletion = TextHelper.HomeCompletion
    let home: [textHelperHomeCompletion.home:String] = [
        .aiachy: "Aiachy",
        .compatibility: "Compatibilité",
        .notUsable: "Non disponible. Vous devez vous abonner.",
        .notHaveAscendant: "Vous devez choisir le signe ascendant."
    ]
    let homeDate: [textHelperHomeCompletion.date:String] = [
        .yesterday: "Hier",
        .today: "Aujourd'hui",
        .tomorrow: "Demain"
    ]
    let homeStatus: [textHelperHomeCompletion.status:String] = [
        .universe: "Univers",
        .enlightenment: "Illumination",
        .touch: "Toucher",
        .love: "Amour",
        .strength: "Force",
        .creative: "Créatif",
        .foundation: "Fondation"
    ]
    
    //MARK: - FrenchLanguage - LoveCompletion -
    typealias textHelperLoveCompletion = TextHelper.LoveCompletion
    let love: [textHelperLoveCompletion.love:String] = [
        .attentionTitle: "L'avenir de l'amour se trouve juste un peu plus loin, soyez patient"
    ]
    
    //MARK: - FrenchLanguage - MysticCompletion -
    typealias textHelperMysticCompletion = TextHelper.MysticCompletion
    let mystic: [textHelperMysticCompletion.mystic:String] = [
        .tarotTitle: "Tarot",
        .palmistryTitle: "Chiromancie",
        .crystalGazingTitle: "Cristallomancie",
        .tarotDescription: "Non disponible à l'utilisation",
        .palmistyrDescription: "Non disponible à l'utilisation",
        .crystalGazingDescription: "Non disponible à l'utilisation"
    ]
    
    //MARK: - FrenchLanguage - GalaxyCompletion -
    typealias textHelperGalaxyCompletion = TextHelper.GalaxyCompletion
    let galaxy: [textHelperGalaxyCompletion.galaxy:String] = [
        .tuneTitle: "Mélodie",
        .meditationTitle: "Méditation"
    ]
    let galaxyTune: [textHelperGalaxyCompletion.tune:String] = [
        .play: "Jouer",
        .stop: "Arrêter",
        .clickToDownload: "Cliquez pour télécharger",
        .downloading: "Téléchargement en cours"
    ]
    
    //MARK: - FrenchLanguage - SettingsCompletion -
    typealias textHelperSettingsCompletion = TextHelper.SettingsCompletion
    let settings: [textHelperSettingsCompletion.settings:String] = [
        .aicyCashTitle: "AicyCash",
        .oracleTitle: "Oracle",
        .oracleHelper: "Aucun",
        .languageTitle: "Langue",
        .themeTitle: "Thème",
        .themeLightHelper: "Clair",
        .themeDarkHelper: "Sombre"
    ]
    let settingsLanguage: [textHelperSettingsCompletion.language:String] = [
        .currentLanguage: "Langue actuelle",
        .otherLanguage: "Autre langue"
    ]
    let settingsOracle: [textHelperSettingsCompletion.oracle:String] = [
        .packageZodiacTitle: "Zodiaque",
        .packageZodiacItem1: "Votre carte astrologique débordera de sagesse cosmique, vous aidant à mieux comprendre la direction de votre vie.",
        .packageZodiacItem2: "Les cartes du Tarot ouvriront de nouvelles portes pour vous et renforceront votre intuition",
        .packageZodiacItem3: "De nouvelles fréquences musicales élèveront votre âme et ouvriront de nouveaux paysages émotionnels pour vous.",
        .packageOracleTitle: "Oracle",
        .packageOracleItem1: "Vous aurez accès aux fonctionnalités de tous les packages disponibles, ce qui vous rendra bien équipé dans tous les domaines.",
        .packageOracleItem2: "Des fonctionnalités innovantes seront à portée de main, vous donnant une longueur d'avance sur tout le monde.",
        .packageOracleItem3: "La gentillesse que vous avez montrée laissera une empreinte éternelle sur les cœurs.",
        .packageOracleItem4: "Ce package sera un outil indispensable pour élever et améliorer votre application."
    ]
    
    //MARK: - FrenchLanguage - ZodiacCompletion -
    typealias textHelperSpiritualCompletion = TextHelper.SpiritualCompletion
    let crystalZodiac: [textHelperSpiritualCompletion.crystalName:String] = [
        .ariesCrystal: "Améthyste",
        .taurusCrystal: "Œil de tigre",
        .geminiCrystal: "Quartz rose",
        .cancerCrystal: "Labradorite",
        .leoCrystal: "Grenat",
        .virgoCrystal: "Pierre de lune",
        .libraCrystal: "Lapis-lazuli",
        .scorpioCrystal: "Tourmaline",
        .sagittariusCrystal: "Obsidienne",
        .capricornCrystal: "Quartz cristal",
        .aquariusCrystal: "Aigue-marine",
        .piscesCrystal: "Perle"
    ]
    
    let dateZodiac: [textHelperSpiritualCompletion.dateZodiac:String] = [
        .piscesZodiacDate: "20 fév - 20 mar",
        .ariesZodiacDate: "21 mar - 20 avr",
        .aquariusZodiacDate: "21 jan - 19 fév",
        .geminiZodiacDate: "21 mai - 21 jun",
        .libraZodiacDate: "24 sept - 23 oct",
        .virgoZodiacDate: "24 aoû - 23 sept",
        .capricornZodiacDate: "22 déc - 20 jan",
        .sagittariusZodiacDate: "23 nov - 21 déc",
        .leoZodiacDate: "23 juil - 23 aoû",
        .scorpioZodiacDate: "24 oct - 22 nov",
        .taurusZodiacDate: "21 avr - 20 mai",
        .cancerZodiacDate: "22 jun - 22 jul"
    ]
}

