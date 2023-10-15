//
//  LanguageInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import Foundation
private protocol ServerProtocol {
    func updateUserLanguage(aiachy aiachyState: AiachyState, entity acyLanguageEntity: ACYLanguageEntity)
}

class LanguageInteractor: ObservableObject {
    
    private let authServerManager: AuthServerManager
    
    init(authServerManager: AuthServerManager = AuthServerManager()) {
        self.authServerManager = authServerManager
    }
    
}
extension LanguageInteractor: ServerProtocol {
    
    /// <#Description#>
    /// - Parameters:
    ///   - aiachyState: <#aiachyState description#>
    ///   - acyLanguageEntity: <#acyLanguageEntity description#>
    func updateUserLanguage(aiachy aiachyState: AiachyState, entity acyLanguageEntity: ACYLanguageEntity) {
        
        let data: [String: Any] = [
            "aiachyInfo" : [
                "version": aiachyState.user.aiachyInfo.version,
                "zodiacDataVersion": aiachyState.user.aiachyInfo.aiachyDataInfo.zodiacDataVersion,
                "tuneDataVersion": aiachyState.user.aiachyInfo.aiachyDataInfo.tuneDataVersion,
                "theme": aiachyState.user.aiachyInfo.theme,
                "language": acyLanguageEntity.countryCode,
                "languageIdentifier": acyLanguageEntity.localeIdentifier
            ]
        ]
        
        authServerManager.updateUserInformationOnServer(aiachy: aiachyState, data: data)
    }
}
