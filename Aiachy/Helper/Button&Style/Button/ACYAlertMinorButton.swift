//
//  ACYAlertMinorButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

struct ACYAlertMinorButton: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    var text: TextHelper.AlertCompletion.button
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(TextHandler.makeAlertButtonString(aiachy: aiachyState, button: text))
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MED_SIZE),
               height: ACYdh(aiachyState, d: ACY_ALTMIN_SIZE))
        .buttonStyle(ACYMinorButtonStyle())
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ACYMinorButtonID")
    }
}

struct ACYErrorButton_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ACYAlertMinorButton(text: .yes) {  }
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}
