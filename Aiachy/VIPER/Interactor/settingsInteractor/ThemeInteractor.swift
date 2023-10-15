//
//  ThemeInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import Foundation

private protocol ServerProtocol {
    
}

class ThemeInteractor: ObservableObject {
    
    private let authServerManager: AuthServerManager
    
    init(authServerManager: AuthServerManager = AuthServerManager()) {
        self.authServerManager = authServerManager
    }
    
}

extension ThemeInteractor: ServerProtocol {
    
    func updateUserTheme(aiachy aiachyState: AiachyState, updateTheme: String) {
        
        let data: [String:Any] = [
            "aiachyInfo" : [
                "version": aiachyState.user.aiachyInfo.version,
                "zodiacDataVersion": aiachyState.user.aiachyInfo.aiachyDataInfo.zodiacDataVersion,
                "tuneDataVersion": aiachyState.user.aiachyInfo.aiachyDataInfo.tuneDataVersion,
                "theme": updateTheme,
                "language": aiachyState.user.aiachyInfo.language
            ]
        ]
        authServerManager.updateUserInformationOnServer(aiachy: aiachyState, data: data)

    }
}
