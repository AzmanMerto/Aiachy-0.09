//
//  ACYDualButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import SwiftUI

struct ACYDualButton<Content:View>: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    var settingsLogo: ImageHelper.SettingsCompletion.settings
    var text: TextHandler.textHelperSettingsCompletion.settings
    var secondButtonContent: Content
    var firstAction: () -> ()
    var secondAction: () -> ()
    
    init(settingsLogo: ImageHelper.SettingsCompletion.settings,
         text: TextHandler.textHelperSettingsCompletion.settings,
         secondButtonContent: @escaping () -> Content,
         firstAction: @escaping () -> Void,
         secondAction: @escaping () -> Void) {
        self.settingsLogo = settingsLogo
        self.text = text
        self.secondButtonContent = secondButtonContent()
        self.firstAction = firstAction
        self.secondAction = secondAction
    }
    
    var body: some View {
        ZStack {
                HStack(spacing: 5) {
                    //MARK: ACYDualButton - firstButton
                    firstButton
                    //MARK: ACYDualButton - line
                    line
                    //MARK: ACYDualButton - secondButton
                    secondButton
                }
                .frame(height: ACYdh(aiachyState, d: 0.056))
        }
        .environmentObject(aiachyState)
    }
}
#Preview("ACYDualButton") {
    ACYDualButton(settingsLogo: .aicyCashLogo,
                  text: .aicyCashTitle,
                  secondButtonContent: { Text("31") },
                  firstAction: {   },
                  secondAction: {  })
        .environmentObject(ACY_PREVIEWS_STATE)
        
}
extension ACYDualButton {
    @ViewBuilder
    private var firstButton: some View {
        Button {
            firstAction()
        } label: {
                Image(ImageHandler.makeSettingsString(aiachyState, settings: settingsLogo))
                    .resizable()
                    .scaledToFit()
                    .frame(width: ACYdw(aiachyState, d: 0.06))
                Text(TextHandler.makeSettingsString(aiachy: aiachyState, settings: text))
                    .font(FontHandler.aiachyFont(.roundedBold14))
        }
        .buttonStyle(ACYDualButtonStyle(isItFirstButton: true))
        .frame(width: ACYdw(aiachyState, d: 0.58))

    }

    private var secondButton: some View {
        Button {
            secondAction()
        } label: {
            secondButtonContent
        }
        .buttonStyle(ACYDualButtonStyle(isItFirstButton: false))
        .frame(width: ACYdw(aiachyState, d: 0.24))
    }
    
    
    private var line: some View {
        Rectangle()
            .frame(width: 2)
            .cornerRadius(20)
            .frame(height: ACYdh(aiachyState, d: 0.028))
    }
    
}
