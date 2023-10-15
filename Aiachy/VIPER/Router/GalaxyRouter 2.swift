//
//  GalaxyRouter.swift
//  Aiachy
//
//  Created by Mert Türedü on 8.08.2023.
//

import SwiftUI

private protocol GalaxyRouterProtocol {
    func navigate(to destination: GalaxyRouterEnum)
}

enum GalaxyRouterEnum {
    case galaxy
    case tune
    case meditation
}

class GalaxyRouterPresenter: ObservableObject, GalaxyRouterProtocol {
    
    @Published var currentView: GalaxyRouterEnum
    
    func navigate(to destination: GalaxyRouterEnum) {
        withAnimation(.spring()) {
            currentView = destination
        }
    }
    
    init(currentView: GalaxyRouterEnum = .galaxy) {
        self.currentView = currentView
    }
}

struct GalaxyRouter: View {
    
    @EnvironmentObject var aiachyState : AiachyState
    @StateObject var presenter = GalaxyRouterPresenter()
    let homeRouter: HomeRouterPresenter
    
    var body: some View {
        ZStack {
            switch presenter.currentView {
            case .galaxy:
                GalaxyView(aiachy: aiachyState, router: presenter)
            case .tune:
                TuneView(aiachy: aiachyState,router: presenter)
            case .meditation:
                MeditationView(router: presenter)
            }
        }
        .onChange(of: presenter.currentView, perform: { viewChanged in
            withAnimation(.spring()) {
                if viewChanged != .galaxy {
                    homeRouter.isDisabledTabBar = true
                } else {
                    homeRouter.isDisabledTabBar = false
                }
            }
        })
        .environmentObject(aiachyState)
    }
}

