//
//  HomeRouter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.05.2023.
// Changed by Mert Türedü on 09.07.2023

import SwiftUI

private protocol RouterProtocol {
    func navigate(to destination: HomeViewsEnum)
}

enum HomeViewsEnum {
    case home
    case mystic
    case galaxy
    case love
    case settings
}

class HomeRouterPresenter: ObservableObject, RouterProtocol {
    
    @Published var currentView: HomeViewsEnum
    @Published var acyAlertEntity: ACYAlertEntity
    @Published var isDisabledTabBar: Bool
    
    func navigate(to destination: HomeViewsEnum) {
        withAnimation(.linear) {
            currentView = destination
        }
    }
    
    init(currentView: HomeViewsEnum = .home,
         acyAlertEntity: ACYAlertEntity = ACYAlertEntity(),
         isDisabledTabBar: Bool = false) {
        self.currentView = currentView
        self.acyAlertEntity = acyAlertEntity
        self.isDisabledTabBar = isDisabledTabBar
    }
}

struct HomeRouter: View {
    
    @EnvironmentObject var aiachyState : AiachyState
    @StateObject var presenter = HomeRouterPresenter()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch presenter.currentView {
                case .home:
                    HomeView(aiachyState: aiachyState, router: presenter)
                case .mystic:
                    MysticRouter(homeRouter: presenter)
                case .galaxy:
                    GalaxyRouter(homeRouter: presenter)
                case .love:
                    LoveRouter(homeRouter: presenter)
                case .settings:
                    SettingsRouter(homeRouter: presenter)
                }
            }
            if !presenter.isDisabledTabBar {
                ACYTabBar(router: presenter)
            }
        }
        .overlay{ 
            if presenter.acyAlertEntity.isShowingAlert {
                ACYAlertView(acyAlertEntity: presenter.acyAlertEntity)
            }
        }
        .environmentObject(aiachyState)
    }
}

