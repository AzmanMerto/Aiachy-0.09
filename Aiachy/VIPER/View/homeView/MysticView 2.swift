//
//  MysticView.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import SwiftUI
//MARK: MysticView - View
struct MysticView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @ObservedObject var presenter = MysticPresenter()
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack{
                //MARK: MysticView - Tabview
                tabView
                    .overlay {
                        //MARK: MysticView - Starter Index
                        starterIndex
                    }
            }
        }
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
//MARK: MysticView - Preview
#Preview {
    MysticView()
        .environmentObject(ACY_PREVIEWS_STATE)
}
 */
//MARK: MysticView - extension
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
