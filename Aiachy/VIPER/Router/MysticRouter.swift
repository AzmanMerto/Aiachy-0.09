//
//  MysticRouter.swift
//  Aiachy
//
//  Created by Mert Türedü on 8.08.2023.
//

import SwiftUI

private protocol MysticRouterProtocol {
    func navigate(to destination: MysticRouterEnum)
}

enum MysticRouterEnum {
    case mystic
}

class MysticRouterPresenter: ObservableObject, MysticRouterProtocol {
    
    @Published var currentView: MysticRouterEnum
    
    func navigate(to destination: MysticRouterEnum) {
        currentView = destination
    }
    
    init(currentView: MysticRouterEnum = .mystic) {
        self.currentView = currentView
    }
}

struct MysticRouter: View {
    
    @EnvironmentObject var aiachyState : AiachyState
    @StateObject var presenter = MysticRouterPresenter()
    let homeRouter: HomeRouterPresenter
    
    var body: some View {
        ZStack {
            switch presenter.currentView {
            case .mystic:
                MysticView(aiachy: aiachyState, homeRouter: homeRouter, router: presenter)
            }
        }
        .environmentObject(aiachyState)
    }
}


