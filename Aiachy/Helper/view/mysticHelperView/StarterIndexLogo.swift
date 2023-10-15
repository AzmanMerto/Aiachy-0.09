//
//  StarterIndexLogo.swift
//  Aiachy
//
//  Created by Mert Türedü on 21.09.2023.
//

import SwiftUI

struct StarterIndexLogo: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let id: Int?
    let entity: ACYmysticStarterLogoEntity
    
    var body: some View {
        Circle()
            .stroke( Color(ColorHandler.makeAiachyColor(aiachyState,
                                           aiachyColor: entity.id == id ? .backgroundColor : .fifthColor)))
            .background(Color(ColorHandler.makeAiachyColor(aiachyState,
                                              aiachyColor: entity.id == id ? .fifthColor : .backgroundColor))
                .clipShape(Circle()))
            .frame(width: ACYdw(aiachyState, d: 0.08))
            .overlay { Image(ImageHandler.makeMysticStarterString(aiachyState,
                                                                  starter: entity.id == id ? entity.selectedLogo : entity.unSelectedLogo))
                    .resizable()
                    .scaledToFit()
                    .padding(3)
                .frame(width: ACYdw(aiachyState, d: 0.06))}
            .animation(.spring(), value: id)
    }
}


#Preview {
    StarterIndexLogo(id: 0, entity: ACYmysticStarterLogoEntity(id: 0, selectedLogo: .crystalGazingStarter1, unSelectedLogo: .crystalGazingStarter1))
        .environmentObject(ACY_PREVIEWS_STATE)
}
