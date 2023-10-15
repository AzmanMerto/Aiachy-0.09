//
//  GalaxyColumn.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.08.2023.
//

import SwiftUI
//MARK: GalaxyColumn - View
struct GalaxyColumn: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let title: TextHelper.GalaxyCompletion.galaxy
    let image: ImageHelper.GalaxyCompletion.galaxy
    let action: () -> ()
    
    var body: some View {
        Button(action: {action()}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .secondColor)),lineWidth: 1.5)
                VStack(spacing: 20) {
                    Image(ImageHandler.makeGalaxyString(aiachyState, galaxy: image))
                        .resizable()
                        .scaledToFit()
                        .frame(width: ACYdw(aiachyState, d: 0.15))
                    //MARK: GalaxyColumn - Title
                    ACYViewTitleText(title: TextHandler.makeGalaxy(aiachy: aiachyState,
                                                                   galaxy: title))
                }
            }
        })
        .frame(width: ACYdw(aiachyState, d: 0.4),
               height: ACYdh(aiachyState, d: 0.2))
    }
}

#Preview {
    GalaxyColumn(title: .meditationTitle,
                     image: .maditationLogo,
                     action: { })
        .environmentObject(ACY_PREVIEWS_STATE)
}
