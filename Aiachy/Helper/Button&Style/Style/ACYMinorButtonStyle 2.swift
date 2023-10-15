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
                .stroke(Color.AiachyColor(aiachyState,
                                          aiachyColor: .secondColor),
                        lineWidth: 1)
            configuration.label
                .foregroundColor(.AiachyColor(aiachyState,
                                              aiachyColor: .secondColor))
                .font(.aiachyFont(.roundedBold14))
        }
        .background(Color.AiachyColor(aiachyState,
                                      aiachyColor: .backgroundColor).cornerRadius(10).shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4))
        .offset(x: 0,
                y: pressed ? 2 : 0 )
    }
}
