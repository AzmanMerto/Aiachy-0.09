//
//  MysticView.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import SwiftUI
//MARK: MysticView - View
struct MysticView: View {
    
    @StateObject var presenter: MysticPresenter
    var aiachyState: AiachyState
    var homeRouter: HomeRouterPresenter
    var router: MysticRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         homeRouter: HomeRouterPresenter,
         router: MysticRouterPresenter) {
        self.aiachyState = aiachyState
        self.homeRouter = homeRouter
        self.router = router
        self._presenter = StateObject(wrappedValue: MysticPresenter(aiachy: aiachyState,
                                                                    homeRouter: homeRouter, 
                                                                    router: router))
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack{
                //MARK: MysticView - Tabview
//                tabView
//                    .overlay {
                        //MARK: MysticView - Starter Index
//                        starterIndex
//                    }
            }
        }
        .environmentObject(aiachyState)
    }
}
//MARK: - MysticView - Preview -
#Preview {
    MysticView(aiachy: ACY_PREVIEWS_STATE,
               homeRouter: HomeRouterPresenter(),
               router: MysticRouterPresenter())
}
//MARK: - MysticView - extension -
extension MysticView {
    //MARK: MysticView - Tabview
    private var tabView: some View {
        TabView(selection: $presenter.selection.animation(.easeInOut),
                content:  {
            TarotStarterView()
                .tag(0)
            PalmistryStarterView()
                .tag(1)
            CrystalGazingStarterView()
                .tag(2)
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
    //MARK: MysticView - Starter Index
    private var starterIndex: some View {
        VStack {
            StarterIndexView(currentLogo: $presenter.selection,
                             entityData: presenter.ACYStarterLogoEntityData)
            Spacer()
        }
    }
}
