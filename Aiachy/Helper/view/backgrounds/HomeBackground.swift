//
//  HomeBackground.swift
//  Aiachy
//
//  Created by Mert Türedü on 13.08.2023.
//

import SwiftUI
//MARK: HomeBackground - View
struct HomeBackground: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    
    var body: some View {
        ZStack {
            Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor))
                .ignoresSafeArea(.all, edges: .all)
        }
    }
}
//MARK: HomeBackground - Preview
#Preview {
    HomeBackground()
        .environmentObject(ACY_PREVIEWS_STATE)
}
