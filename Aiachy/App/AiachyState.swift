//
//  AiachyState.swift
//  Aiachy
//
//  Created by Mert Türedü on 18.05.2023.
//

import SwiftUI



class AiachyState: ObservableObject {
    
    @Published var acyAiachyRepo: ACYAiachyRepo
    @Published var user: User
    @Published var isGuest: Bool
    
    init(acyAiachyRepo: ACYAiachyRepo = ACYAiachyRepo(),
        user: User = User(),
         isGuest: Bool = false,
         isNeedUpdateZodiacData: Bool = false) {
        self.acyAiachyRepo = acyAiachyRepo
        self.user = user
        self.isGuest = isGuest
    }
}

