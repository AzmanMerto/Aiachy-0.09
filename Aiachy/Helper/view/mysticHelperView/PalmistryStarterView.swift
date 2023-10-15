//
//  PalmistryStarterView.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.08.2023.
//

import SwiftUI

struct PalmistryStarterView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var isOnAppear: Bool = false

    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                Image(ImageHandler.makeMysticStarterString(aiachyState, starter: .palmistryStarter2))
                    .resizable()
                    .scaledToFit()
                    .offset(x: isOnAppear ? ACYdw(aiachyState, d: 0.23) : ACYdw(aiachyState, d: 0.7))
                    .opacity(isOnAppear ? 1 : 0)
                Image(ImageHandler.makeMysticStarterString(aiachyState, starter: .palmistryStarter3))
                    .resizable()
                    .scaledToFit()
                    .opacity(isOnAppear ? 1 : 0)
                Image(ImageHandler.makeMysticStarterString(aiachyState, starter: .palmistryStarter1))
                    .resizable()
                    .scaledToFit()
                    .offset(x: isOnAppear ? ACYdw(aiachyState, d: 0) : ACYdw(aiachyState, d: -0.7))
                    .opacity(isOnAppear ? 1 : 0)
                    .frame(height: ACYdw(aiachyState, d: 0.5))
            }
            ACYMysticTitleAndDescriptionText(fontType: .CinzelBlack30, 
                                             title: .palmistryTitle,
                                             description: .palmistyrDescription)
            .opacity(isOnAppear ? 1 : 0)
        }
        .onAppear { withAnimation(.linear(duration: 1.2)) { isOnAppear = true } }
        .onDisappear { withAnimation(.linear(duration: 1.2)) { isOnAppear = false } }
        .environmentObject(aiachyState)
    }
}

#Preview {
    PalmistryStarterView(isOnAppear: true)
        .environmentObject(ACY_PREVIEWS_STATE)
}
