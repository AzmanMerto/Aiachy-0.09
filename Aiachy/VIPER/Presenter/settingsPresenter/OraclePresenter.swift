//
//  OraclePresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import Foundation

private protocol HandlerProtocol {
    
}
private protocol StoreProtocol {
    
}
private protocol AlertProtocol {
    
}


class OraclePresenter: ObservableObject {
    
    @Published var acyAlertEntity = ACYAlertEntity()
    @Published var currentIndex: Int
    let aiachyState: AiachyState
    let router: SettingsRouterPresenter
    let interactor: OracleInteractor
    
    
    init(currentIndex: Int = 0,
         aiachy aiachyState: AiachyState,
         router: SettingsRouterPresenter,
         interactor: OracleInteractor = OracleInteractor()) {
        self.currentIndex = currentIndex
        self.aiachyState = aiachyState
        self.router = router
        self.interactor = interactor
        
        makeAlert()
    }
    
}

extension OraclePresenter: StoreProtocol{

}

extension OraclePresenter: AlertProtocol {
    func makeAlert() {
        
        let madedAcyAlertEntity = ACYAlertEntity(description: .notReady, image: .notReady, firstButtonText: .okey, isShowingAlert: true, typeError: 4, firstAction: {
            self.acyAlertEntity = ACYAlertEntity()
            self.router.navigate(to: .settings)
        })
        acyAlertEntity = madedAcyAlertEntity
    }
}
