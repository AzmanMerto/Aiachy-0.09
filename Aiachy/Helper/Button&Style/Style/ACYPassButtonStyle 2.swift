//
//  ACYPassButtonStyle.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

//NeedRefator:
struct ACYPassButtonStyle: ButtonStyle {
    
    @EnvironmentObject var aiachyState: AiachyState
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.AiachyColor(aiachyState,
                                          aiachyColor: .secondColor))
            configuration.label
                .foregroundColor(Color.AiachyColor(aiachyState,
                                                   aiachyColor: .thirdColor))
                .font(.aiachyFont(.roundedBold14))
        }
    }
}
