//
//  LanguagePresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import Foundation

private protocol HandlerProtocol {
    func makeUserConvertToLanguageEntity()
}

private protocol ServerProtocol {
    func updateUserLanguageOnServer(entity acyLanguageEntity: ACYLanguageEntity)
}

class LanguagePresenter: ObservableObject {
    
    @Published var currentLanguage: ACYLanguageEntity?
    private let aiachyState: AiachyState
    private let router: SettingsRouterPresenter
    private let interactor: LanguageInteractor
    
    init(aiachyState: AiachyState,
         router: SettingsRouterPresenter,
         interactor: LanguageInteractor = LanguageInteractor()) {
        self.aiachyState = aiachyState
        self.router = router
        self.interactor = interactor
        
        self.makeUserConvertToLanguageEntity()
    }
    
    /// <#Description#>
    /// - Parameter acyLanguageEntity: <#acyLanguageEntity description#>
    func updateAiachyState(entity acyLanguageEntity: ACYLanguageEntity) {
        let countryCode = acyLanguageEntity.countryCode
        aiachyState.user.aiachyInfo.language = countryCode
        makeUserConvertToLanguageEntity()
        updateUserLanguageOnServer(entity: acyLanguageEntity)
        updateLocalLanguage(entity: acyLanguageEntity)
        changeLanguage(to: acyLanguageEntity.localeIdentifier)
    }
    
    /// <#Description#>
    /// - Returns: <#description#>
    func filterACYLanguageEntityData() -> [ACYLanguageEntity] {
        ACYLanguageEntityData.filter { $0.id != currentLanguage?.id }
    }
    
    lazy var ACYLanguageEntityData: [ACYLanguageEntity] = [
        ACYLanguageEntity(id:0, image: .türkiye, text: .türkiye, countryCode: "TR", localeIdentifier: "tr_TR"),
        ACYLanguageEntity(id:1, image: .denmark, text: .denmark, countryCode: "DK", localeIdentifier: "da_DK"),
        ACYLanguageEntity(id:2, image: .france, text: .france, countryCode: "FR", localeIdentifier: "fr_FR"),
        ACYLanguageEntity(id:3, image: .germany, text: .germany, countryCode: "DE", localeIdentifier: "de_DE"),
        ACYLanguageEntity(id:4, image: .greece, text: .greece, countryCode: "GR", localeIdentifier: "el_GR"),
        ACYLanguageEntity(id:5, image: .unitedKingdom, text: .unitedKingdom, countryCode: "GB", localeIdentifier: "en_GB"),
        ACYLanguageEntity(id:6, image: .unitedArabEmirates, text: .unitedArabEmirates, countryCode: "AE", localeIdentifier: "ar_AE"),
        ACYLanguageEntity(id:7, image: .poland, text: .poland, countryCode: "PL", localeIdentifier: "pl_PL"),
        ACYLanguageEntity(id:8, image: .italy, text: .italy, countryCode: "IT", localeIdentifier: "it_IT"),
        ACYLanguageEntity(id:9, image: .romania, text: .romania, countryCode: "RO", localeIdentifier: "ro_RO"),
        ACYLanguageEntity(id:10, image: .russianFederation, text: .russianFederation, countryCode: "RU", localeIdentifier: "ru_RU"),
        ACYLanguageEntity(id:11, image: .ukraine, text: .ukraine, countryCode: "UA", localeIdentifier: "uk_UA"),
        ACYLanguageEntity(id:12, image: .unitedStates, text: .unitedStates, countryCode: "US", localeIdentifier: "en_US")
    ]
}
//NextpatchTODO: 2323
extension LanguagePresenter: HandlerProtocol {
    /// <#Description#>
    fileprivate func makeUserConvertToLanguageEntity() {
        let languageCode = aiachyState.user.aiachyInfo.wrappedLanguage
        let convertedValue = ACYLanguageEntityData.filter { $0.countryCode == languageCode }.first
        self.currentLanguage = convertedValue
    }
    
    /// <#Description#>
    /// - Parameter localeIdentifier: <#localeIdentifier description#>
    fileprivate func changeLanguage(to localeIdentifier: String) {
        UserDefaults.standard.set([localeIdentifier], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    fileprivate func updateLocalLanguage(entity acyLanguageEntity: ACYLanguageEntity) {
        aiachyState.user.aiachyInfo.language = acyLanguageEntity.countryCode
        aiachyState.user.aiachyInfo.languageIdentifier =  acyLanguageEntity.localeIdentifier
    }
    
}

extension LanguagePresenter: ServerProtocol {
    /// <#Description#>
    /// - Parameter acyLanguageEntity: <#acyLanguageEntity description#>
    fileprivate func updateUserLanguageOnServer(entity acyLanguageEntity: ACYLanguageEntity) {
        interactor.updateUserLanguage(aiachy: aiachyState, entity: acyLanguageEntity)
    }
}
