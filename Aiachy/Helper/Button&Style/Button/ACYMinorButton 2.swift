//
//  ACYMinorButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

struct ACYMinorButton: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    var text: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text.locale())
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MED_SIZE),
               height: ACYdh(aiachyState, d: ACY_MIN_SIZE))
        .buttonStyle(ACYMinorButtonStyle())
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ACYMinorButtonID")
    }
}

struct ACYErrorButton_Previews: PreviewProvider {
    
    static let text = ACYTextHelper.ACYAppText.ACYappButtonText.ContinueButton.rawValue
    
    static var previews: some View {
        ACYMinorButton(text: ACYTextHelper.ACYAppText.ACYappButtonText.TryAgainButton.rawValue) {  }
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}
