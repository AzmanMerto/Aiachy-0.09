//
//  SettingsRouter.swift
//  Aiachy
//
//  Created by Mert Türedü on 8.08.2023.
//

import SwiftUI

private protocol SettingsRouterProtocol {
    func navigate(to destination: SettingsRouterEnum)
}

enum SettingsRouterEnum {
    case settings
    case aicyCash
    case oracle
    case language
    case theme
}

class SettingsRouterPresenter: ObservableObject, SettingsRouterProtocol {
    
    @Published var currentView: SettingsRouterEnum
    @Published var isLogout: Bool
    
    func navigate(to destination: SettingsRouterEnum) {
        withAnimation(.spring()) {
            currentView = destination
        }
    }
    
    init(currentView: SettingsRouterEnum = .settings,
         isLogout: Bool = false ) {
        self.currentView = currentView
        self.isLogout = isLogout
    }
}

struct SettingsRouter: View {
    
    @EnvironmentObject var aiachyState : AiachyState
    @StateObject var presenter = SettingsRouterPresenter()
    let homeRouter: HomeRouterPresenter
    
    var body: some View {
        ZStack {
            switch presenter.currentView {
            case .settings:
                SettingsView(aiachy: aiachyState, homeRouter: homeRouter, router: presenter)
            case .aicyCash:
                AicyCashView(aiachy: aiachyState, router: presenter)
            case .oracle:
                OracleView(aiachy: aiachyState, router: presenter)
            case .language:
                LanguageView(aiachy: aiachyState, router: presenter)
            case .theme:
                ThemeView(aiachy: aiachyState, router: presenter)
            }
        }

        .fullScreenCover(isPresented: $presenter.isLogout, content: {
            SplashView()
        })
        .onChange(of: presenter.currentView, perform: { viewChanged in
            withAnimation(.spring()) {
                if viewChanged != .settings {
                    homeRouter.isDisabledTabBar = true
                } else {
                    homeRouter.isDisabledTabBar = false
                }
            }
        })
        .environmentObject(aiachyState)
    }
}

