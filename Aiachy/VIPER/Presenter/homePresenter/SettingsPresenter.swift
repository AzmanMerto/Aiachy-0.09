//
//  SettingsPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import Foundation

private protocol HandlerProtocol {
    func checkPreferedLogin()
}

private protocol AlertProtocol {
    func makeAlert()
    func closeAlert()
}

class SettingsPresenter: ObservableObject {
    
    let aiachyState: AiachyState
    let homeRouter: HomeRouterPresenter
    let router: SettingsRouterPresenter
    
    init(aiachyState: AiachyState,
         homeRouter: HomeRouterPresenter,
         router: SettingsRouterPresenter = SettingsRouterPresenter()) {
        self.aiachyState = aiachyState
        self.homeRouter = homeRouter
        self.router = router
    }
    
    func navigateToSettingsView(to navigate: SettingsRouterEnum ) {
        
        if aiachyState.isGuest {
              makeAlert()
        } else {
            router.navigate(to: navigate)
        }
    }
}

extension SettingsPresenter: HandlerProtocol {
    func checkPreferedLogin() {
        if aiachyState.isGuest {
            aiachyState.isGuest = false
            router.isLogout = true
            aiachyState.user = User(deviceInfo: aiachyState.user.deviceInfo)
        } else {
            aiachyState.user.userInfo.id = nil
            router.isLogout = true
            ACYUserDefaults.set("", forKey: ACYUserID)
            aiachyState.user = User(deviceInfo: aiachyState.user.deviceInfo)
        }
    }
}

extension SettingsPresenter: AlertProtocol {
    func makeAlert() {
        homeRouter.acyAlertEntity = ACYAlertEntity(title: .needToRegister,
                                         image: .needToRegister,
                                         firstButtonText: .tryAgain,
                                         isShowingAlert: true,
                                         typeError: 2,
                                         firstAction: { self.closeAlert()   })
    }
    
    func closeAlert() {
        homeRouter.acyAlertEntity = ACYAlertEntity()
    }
    
    
    

    
}
