//
//  ACYButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import SwiftUI

struct ACYButton: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text.locale())
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MIN_SIZE))
        .buttonStyle(ACYButtonStyle())
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ACYButtonID")
    }
}

struct aiachyButton_Previews: PreviewProvider {
    
    static let text = ACYTextHelper.ACYAppText.ACYappButtonText.ContinueButton.rawValue
    
    static var previews: some View {
        ACYButton(text: text) { }
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}

