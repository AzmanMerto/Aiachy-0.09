//
//  LovePresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import Foundation
import Combine
//MARK: LovePresenter - protocol - AlertProtocol
private protocol AlertProtocol {
    func makeAlert()
}
//MARK: LovePresenter - Presenter
class LovePresenter: ObservableObject {
    
    let aiachyState: AiachyState
    let homeRouter: HomeRouterPresenter
    let router: LoveRouterPresenter

    init(aiachyState: AiachyState,
         homeRouter: HomeRouterPresenter,
         router: LoveRouterPresenter) {
        self.aiachyState = aiachyState
        self.homeRouter = homeRouter
        self.router = router
    }
    
}
//MARK: LovePresenter - extension - AlertProtocol
extension LovePresenter: AlertProtocol {
    func makeAlert() {
        homeRouter.acyAlertEntity.title = .areYouSure
        homeRouter.acyAlertEntity.firstButtonText = .no
        homeRouter.acyAlertEntity.secondButtonText = .yes
        homeRouter.acyAlertEntity.typeError = 1
        homeRouter.acyAlertEntity.isShowingAlert = true
        homeRouter.acyAlertEntity.firstAction = {
            self.homeRouter.acyAlertEntity.isShowingAlert = false
        }
        homeRouter.acyAlertEntity.secondAction = {
            self.homeRouter.acyAlertEntity.isShowingAlert = false
        }
    }
}
