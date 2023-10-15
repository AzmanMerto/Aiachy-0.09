//
//  ACYButtonStyle.swift
//  Aiachy
//
//  Created by Mert Türedü on 18.05.2023.
//

import SwiftUI

struct ACYButtonStyle: ButtonStyle {
    
    @EnvironmentObject var aiachyState: AiachyState
    
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(ColorHandler.makeAiachyColor(aiachyState,
                                          aiachyColor: .secondColor)),
                        lineWidth: 1)
            configuration.label
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                              aiachyColor: .backgroundColor)))
                .font(FontHandler.aiachyFont(.roundedBold14))
        }
        .background(Color(ColorHandler.makeAiachyColor(aiachyState,
                                      aiachyColor: .firstColor))
            .cornerRadius(10))
        .offset(x: 0,
                y: pressed ? 2 : 0)
    }
}
