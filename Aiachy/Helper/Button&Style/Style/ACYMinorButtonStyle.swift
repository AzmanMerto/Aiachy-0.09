//
//  ACYMinorButtonStyle.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

struct ACYMinorButtonStyle: ButtonStyle {
    
    @EnvironmentObject var aiachyState: AiachyState
    
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .secondColor)),
                        lineWidth: 1)
            configuration.label
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .secondColor)))
                .font(FontHandler.aiachyFont(.roundedBold14))
        }
        .background(Color(ColorHandler.makeAiachyColor(aiachyState,aiachyColor: .backgroundColor))
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4))
        .offset(y: pressed ? 2 : 0 )
    }
}
