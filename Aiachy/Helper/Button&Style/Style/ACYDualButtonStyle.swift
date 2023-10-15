//
//  ACYDualButtonStyle.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import SwiftUI
//MARK: - ACYDualButtonStyle - ButtonStyle -
struct ACYDualButtonStyle: ButtonStyle {
    
    @EnvironmentObject var aiachyState: AiachyState
    var isItFirstButton: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            background
            HStack {
                if isItFirstButton {
                    label(configuration: configuration, fontHelper: .roundedSemiBold12)
                    Spacer()
                } else {
                    label(configuration: configuration, fontHelper: .roundedBold16)
                }
            }
            .padding(.horizontal)
        }
    }
}
//MARK: - ACYDualButtonStyle - extension -
extension ACYDualButtonStyle {
    //MARK: ACYDualButtonStyle - Background
    private var background: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color(ColorHandler.makeAiachyColor(aiachyState,
                                          aiachyColor: .secondColor)), lineWidth: 1)
            .background(Color(ColorHandler.makeAiachyColor(aiachyState,
                                              aiachyColor: .backgroundAlternativeColor))
                .cornerRadius(20)
                .shadow(color: Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                    .opacity(0.3), radius: 4, x: 0, y: 4))
    }
    //MARK: ACYDualButtonStyle - Label
    private func label(configuration: Configuration, fontHelper: FontHelper.aiachyFontType) -> some View {
        configuration.label
            .font(FontHandler.aiachyFont(fontHelper))
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .thirdColor)))
    }
}
