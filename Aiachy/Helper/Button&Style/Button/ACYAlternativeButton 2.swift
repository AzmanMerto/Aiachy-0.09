//
//  ACYAlternativeButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

struct ACYAlternativeButton: View {
    
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
        .buttonStyle(ACYAlternativeButtonStyle())
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ACYAlternativeButtonID")
    }
}

struct ACYAlternativeButton_Previews: PreviewProvider {
    static var previews: some View {
        ACYAlternativeButton(text: "") {}
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}
