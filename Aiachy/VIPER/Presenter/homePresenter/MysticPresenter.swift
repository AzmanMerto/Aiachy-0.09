//
//  MysticPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import SwiftUI

private protocol AlertProtocol {
    
}

class MysticPresenter: ObservableObject {
    
    @Published var acyAlertEntity = ACYAlertEntity()
    @Published var selection: Int
    let aiachyState: AiachyState
    let homeRouter: HomeRouterPresenter
    let router: MysticRouterPresenter
    let interactor: MysticInteractor

    
    init(selection: Int = 0,
         aiachy aiachyState: AiachyState,
         homeRouter: HomeRouterPresenter,
         router: MysticRouterPresenter,
         interactor: MysticInteractor = MysticInteractor()) {
        self.selection = selection
        self.homeRouter = homeRouter
        self.aiachyState = aiachyState
        self.router = router
        self.interactor = interactor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.makeAlert()
        }
    }
    
    let ACYStarterLogoEntityData: [ACYmysticStarterLogoEntity] = [
        ACYmysticStarterLogoEntity(id: 0, selectedLogo: .tarotLogoSelected, unSelectedLogo: .tarotLogoUnSelected),
        ACYmysticStarterLogoEntity(id: 1, selectedLogo: .palmistryLogoSelected, unSelectedLogo: .palmistryLogoUnSelected),
        ACYmysticStarterLogoEntity(id: 2, selectedLogo: .crystalGazingStarterLogoSelected, unSelectedLogo: .crystalGazingStarterLogoUnSelected)
    ]
    
}


extension MysticPresenter {
    
    func makeAlert() {
        
        
        let acyAlert = ACYAlertEntity(title: .notReady, image: .notReady, firstButtonText: .okey, isShowingAlert: true, typeError: 2, firstAction:  {
            self.homeRouter.acyAlertEntity = ACYAlertEntity()
            self.homeRouter.navigate(to: .home)
        })
        
        homeRouter.acyAlertEntity = acyAlert
    }
    
}
