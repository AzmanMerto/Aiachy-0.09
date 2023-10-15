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
    var firstText: String
    var secondButton: Content
    var firstAction: () -> ()
    var secondAction: () -> ()
    
    init(settingsLogo: ImageHelper.SettingsCompletion.settings,
         firstText: String,
         content: @escaping () -> Content,
         firstAction: @escaping () -> Void,
         secondAction: @escaping () -> Void) {
        self.settingsLogo = settingsLogo
        self.firstText = firstText
        self.secondButton = content()
        self.firstAction = firstAction
        self.secondAction = secondAction
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                //MARK: ACYDualButton - FirstButton -
                Button {
                    firstAction()
                } label: {
                    Image(ImageHandler.makeSettingsString(aiachyState, settings: settingsLogo))
                        .resizable()
                        .scaledToFit()
                        .frame(width: ACYdw(aiachyState, d: 0.05))
                    Text(firstText)
                }
                .buttonStyle(ACYDualButtonStyle(isItFirstButton: true))
                .frame(width: ACYdw(aiachyState, d: 0.67))
                
                Rectangle()
                    .frame(width: 1)
                    .padding(.vertical)
                //MARK: ACYDualButton - SecondButton -
                Button {
                    firstAction()
                } label: {
                    secondButton
                }
                .buttonStyle(ACYDualButtonStyle(isItFirstButton: false))
                .frame(width: ACYdw(aiachyState, d: 0.26))
            }
            .frame(height: ACYdh(aiachyState, d: 0.065))
        }
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
#Preview {
    ACYDualButton(settingsLogo: .aicyCashLogo,
                  firstText: "",
                  content: { Text("Content") },
                  firstAction: {   },
                  secondAction: {  })
        .environmentObject(ACY_PREVIEWS_STATE)
}
*/
