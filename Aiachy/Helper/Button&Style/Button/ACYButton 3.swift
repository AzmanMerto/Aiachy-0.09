//
//  ACYButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import SwiftUI

struct ACYButton: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let text: TextHelper.GeneralCompletion.button
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(TextHandler.makeGeneralButtonString(aiachy: aiachyState,
                                                     button: text))
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MIN_SIZE))
        .buttonStyle(ACYButtonStyle())
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ACYButtonID")
    }
}
// WillAdded:
/*
#Preview {
 ACYButton(text: .continue) {
 
 }
 .environmentObject(ACY_PREVIEWS_STATE)
 }
 
 */
