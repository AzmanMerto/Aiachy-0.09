//
//  ACYPassButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI
//MARK: - ACYPassButton - View -
struct ACYPassButton: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    var isItBackButton: Bool
    var text : TextHelper.GeneralCompletion.button
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0) {
                if isItBackButton {
                    //MARK: ACYPassButton - buttonArrow
                    buttonArrow
                }
                //MARK: ACYPassButton - buttonText
                buttonText
                
                if !isItBackButton {
                    //MARK: ACYPassButton - buttonArrow
                    buttonArrow
                }
            }
        }
        .frame(width: ACYdw(aiachyState, d: 0.18),
               height: ACYdh(aiachyState, d: ACY_MIKRO_SIZE))
        .buttonStyle(ACYPassButtonStyle())
        .makeAccessibilitysForUITest(identifier: "ACYPassButtonID")
    }
}

struct ACYPassButton_Preview: PreviewProvider {
    static var previews: some View {
        ACYPassButton(isItBackButton: false, text: .back) {
            
        }
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}

// WillAdded:
/*
//MARK: - ACYPassButton - Preview -
#Preview("ACYPassButton") {
    ACYPassButton(isItBackButton: true, text: .guest) {}
        .environmentObject(ACY_PREVIEWS_STATE)
}
 */
//MARK: - ACYPassButton - extension -
extension ACYPassButton {
    //MARK: ACYPassButton - buttonArrow
    private var buttonArrow: some View {
        Image(ImageHandler.makeGeneralButtonString(aiachyState, button: .rightArrowButton))
            .resizable()
            .frame(width: ACYdw(aiachyState, d: 0.015),
                   height: ACYdh(aiachyState, d: 0.014))
            .scaledToFit()
            .rotate(isItBackButton ? 180 : 0)
    }
    //MARK: ACYPassButton - buttonText
    private var buttonText: some View {
        Text(TextHandler.makeGeneralButtonString(aiachy: aiachyState, button: text))
            .lineLimit(1)
            .font(.aiachyFont(.roundedBold12))
            .frame(width: ACYdw(aiachyState, d: ACY_ALTSML_SIZE))
            .multilineTextAlignment(.leading)
            .frame(width: ACYdw(aiachyState, d: 0.14),
                   height: ACYdh(aiachyState, d: 0.02))
    }
}
