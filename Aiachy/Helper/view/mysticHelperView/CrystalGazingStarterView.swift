//
//  CrystalGazingStarterView.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.08.2023.
//

import SwiftUI

struct CrystalGazingStarterView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var isOnAppear: Bool = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(ImageHandler.makeMysticStarterString(aiachyState, starter: .crystalGazingStarter1))
                    .resizable()
                    .scaledToFill()
                    .offset(y: isOnAppear ? 0 : ACYdh(aiachyState, d: -0.5))
                    .opacity(isOnAppear ? 1 : 0)
                Image(ImageHandler.makeMysticStarterString(aiachyState, starter: .crystalGazingStarter1))
                    .resizable()
                    .scaledToFill()
                    .offset(y: isOnAppear ? 0 : ACYdh(aiachyState, d: 0.5))
                    .opacity(isOnAppear ? 1 : 0)
            }
            Image(ImageHandler.makeMysticStarterString(aiachyState, starter: .crystalGazingStarter2))
                .resizable()
                .scaledToFit()
                .frame(width: ACYdw(aiachyState, d: 0.5))
                .offset(y: isOnAppear ? 0 : ACYdh(aiachyState, d: -0.7))
                .opacity(isOnAppear ? 1 : 0)
            ACYMysticTitleAndDescriptionText(fontType: .CinzelBlack30,
                                             title: .crystalGazingTitle,
                                             description: .crystalGazingDescription)
            .offset(y: isOnAppear ? ACYdh(aiachyState, d: -0.22) : ACYdh(aiachyState, d: -0.7))
            .opacity(isOnAppear ? 1 : 0)
        }
        .onAppear { withAnimation(.spring()) { isOnAppear = true } }
        .onDisappear { withAnimation(.spring()) { isOnAppear = false } }
        .environmentObject(aiachyState)
    }
}

#Preview {
    CrystalGazingStarterView(isOnAppear: true)
        .environmentObject(ACY_PREVIEWS_STATE)
}
