//
//  TarotStarterView.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.08.2023.
//

import SwiftUI

struct TarotStarterView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var isOnAppear: Bool = false
    
    var body: some View {
        ZStack {
            HomeBackground()
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Image(ImageHandler.makeMysticStarterString(aiachyState, 
                                                               starter: .tarotStarter1))
                        .resizable()
                        .rotate(22)
                        .scaledToFit()
                        .offset(x: isOnAppear ? 0 : ACYdw(aiachyState, d: 0.5))
                        .opacity(isOnAppear ? 1 : 0)
                    
                    Image(ImageHandler.makeMysticStarterString(aiachyState, 
                                                               starter: .tarotStarter2))
                        .resizable()
                        .rotate(-22)
                        .scaledToFit()
                        .offset(x: isOnAppear ? 0 : ACYdw(aiachyState, d: 0.5))
                        .opacity(isOnAppear ? 1 : 0)
                }
                .padding(.leading, ACYdw(aiachyState, d: -0.1))
                
                ACYMysticTitleAndDescriptionText(fontType: .CinzelBlack50,
                                                 title: .tarotTitle,
                                                 description: .tarotDescription)
                .offset(x: isOnAppear ? 0 : ACYdw(aiachyState, d: 0.5))
                    .opacity(isOnAppear ? 1 : 0)
            }
        }
        .onAppear { withAnimation(.spring()) { isOnAppear = true } }
        .onDisappear { withAnimation(.spring()) { isOnAppear = false } }
        .environmentObject(aiachyState)
    }
}

#Preview {
    TarotStarterView(isOnAppear: true)
        .environmentObject(ACY_PREVIEWS_STATE)
}
