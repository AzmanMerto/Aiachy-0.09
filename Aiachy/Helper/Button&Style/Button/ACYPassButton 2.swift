//
//  ACYPassButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

struct ACYPassButton: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    var isItBackButton: Bool
    var text : String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                if isItBackButton {
                    Image.setACYButtonImage(aiachyState, button: .leftArrowButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: ACYdw(aiachyState, d: 0.05),
                               height: ACYdh(aiachyState, d: 0.02))
                }
                Text(text.locale())
                    .lineLimit(1)
                    .font(.aiachyFont(.roundedBold14))
                    .frame(width: ACYdw(aiachyState, d: ACY_SML_SIZE))
                    .multilineTextAlignment(.leading)
                    
                if !isItBackButton {
                    Image.setACYButtonImage(aiachyState, button: .rightArrowButton)
                        .resizable()
                        .scaledToFit()
                        .frame(width: ACYdw(aiachyState, d: 0.05),
                               height: ACYdh(aiachyState, d: 0.02))
                }
            }
        }
        .buttonStyle(ACYPassButtonStyle())
        .frame(width: ACYdw(aiachyState, d: ACY_ALTMED_SIZE),
               height: ACYdh(aiachyState, d: ACY_MAKRO_SIZE))
        .makeAccessibilitysForUITest(identifier: "ACYPassButtonID")
    }
}

struct ACYPassButton_Previews: PreviewProvider {
        
    static var previews: some View {
        ACYPassButton(isItBackButton: true, text: "Tillbaka") { }
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}
