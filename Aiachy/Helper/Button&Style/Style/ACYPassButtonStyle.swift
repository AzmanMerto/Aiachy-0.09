//
//  ACYPassButtonStyle.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

//MARK: ACYPassButtonStyle - ButtonStyle
struct ACYPassButtonStyle: ButtonStyle {
    
    @EnvironmentObject var aiachyState: AiachyState
    
    func makeBody(configuration: Configuration) -> some View {
            //MARK: ACYPassButtonStyle - label
           label(configuration: configuration)
            .background { background }
    }
}

extension ACYPassButtonStyle {
    //MARK: ACYPassButtonStyle - background
    private var background: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color(ColorHandler.makeAiachyColor(aiachyState,
                                      aiachyColor: .secondColor)))
            .background(Color(ColorHandler.makeAiachyColor(aiachyState,
                                              aiachyColor: .backgroundColor))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color(ColorHandler.makeAiachyColor(aiachyState,
                                                                  aiachyColor: .fifthColor))
                    .opacity(0.4), radius: 2, x: 0, y: 2))
    }
    //MARK: ACYPassButtonStyle - label
    func  label(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                               aiachyColor: .thirdColor)))
            .font(FontHandler.aiachyFont(.roundedBold12))
    }
}
