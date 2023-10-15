//
//  AicyCashPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import Foundation

class AicyCashPresenter: ObservableObject {
    
    let aiachyState: AiachyState
    
    init(aiachyState: AiachyState) {
        self.aiachyState = aiachyState
    }
    
}
