//
//  GalaxyPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import SwiftUI

private protocol AiachyStateHandlerProtocol {
    func updateTuneEntityData(aiachy aiachyState: AiachyState)
}

class GalaxyPresenter: ObservableObject {
    
    let aiachyState: AiachyState
    let interactor: GalaxyInteractor
    let columns: [GridItem]
    
    init(aiachyState: AiachyState,
         interactor: GalaxyInteractor = GalaxyInteractor(),
         columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)) {
        self.aiachyState = aiachyState
        self.interactor = interactor
        self.columns = columns
        
        updateTuneEntityData(aiachy: aiachyState)
    }
    
}

extension GalaxyPresenter: AiachyStateHandlerProtocol {
    func updateTuneEntityData(aiachy aiachyState: AiachyState) {
        if !aiachyState.isGuest {
            interactor.updateTuneEntityData(aiachy: aiachyState) { aiachyState.acyAiachyRepo.acyTuneEntityRepo = $0 }
        }
    }
}
