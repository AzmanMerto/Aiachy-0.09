//
//  StarterIndexView.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.08.2023.
//

import SwiftUI

struct StarterIndexView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var currentLogo: Int
    let entityData: [ACYmysticStarterLogoEntity]
    
    var body: some View {
        ZStack {
            //MARK: StarterIndexView - Background
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                .background(Color.makeAiachyColor(aiachyState, aiachyColor: .backgroundAlternativeColor).clipShape(RoundedRectangle(cornerRadius: 25)))
            //MARK: StarterIndexView - Logo
            HStack {
                ForEach(entityData, id: \.id) { starterLogo in
                    StarterIndexLogo(id: currentLogo, entity: starterLogo)
                        .onTapGesture {
                            currentLogo = starterLogo.id
                        }
                }
            }
            .padding(.horizontal,5)
        }
        .frame(width: ACYdw(aiachyState, d: 0.3),
               height: ACYdh(aiachyState, d: 0.05))
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
#Preview {
    
    StarterIndexView(currentLogo: .constant(0),
                     entityData: [ACYmysticStarterLogoEntity(id: 0,
                                                             selectedLogo: .tarotLogoSelected,
                                                             unSelectedLogo: .tarotLogoUnSelected),
                                  ACYmysticStarterLogoEntity(id: 1,
                                                             selectedLogo: .palmistryLogoSelected,
                                                       unSelectedLogo: .palmistryLogoUnSelected),
                                  ACYmysticStarterLogoEntity(id: 2,
                                                       selectedLogo: .crystalGazingStarterLogoSelected,
                                                       unSelectedLogo: .crystalGazingStarterLogoUnSelected)])
    .environmentObject(ACY_PREVIEWS_STATE)
}
*/
struct StarterIndexLogo: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let id: Int?
    let entity: ACYmysticStarterLogoEntity
    
    var body: some View {
        Circle()
            .stroke( Color.makeAiachyColor(aiachyState, 
                                           aiachyColor: entity.id == id ? .backgroundColor : .fifthColor))
            .background(Color.makeAiachyColor(aiachyState, 
                                              aiachyColor: entity.id == id ? .fifthColor : .backgroundColor).clipShape(Circle()))
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
