//
//  LanguageColumn.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import SwiftUI

struct LanguageColumn: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let entity: ACYLanguageEntity
    let action: () -> ()
    
    var body: some View {
        Button(action: {action()}, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .secondColor)))
                    .background(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundAlternativeColor)).cornerRadius(20))
                ZStack {
                    Text(TextHandler.makeGeneralFlagString(aiachy: aiachyState, flag: entity.text))
                        .font(FontHandler.aiachyFont(.roundedBold16))
                        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)))
                    HStack {
                        Spacer()
                        Image(ImageHandler.makeGeneralFlagString(flag: entity.image))
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                    }
                }
                .padding(.horizontal)
            }
        })
        .frame(width: ACYdw(aiachyState, d: 0.9),
               height: ACYdh(aiachyState, d: 0.07))
        .environmentObject(aiachyState)
    }
}
#Preview("LanguageColumn") {
    LanguageColumn(entity: ACYLanguageEntity(id: 0, image: .türkiye, text: .türkiye, countryCode: "TR", localeIdentifier: "tr_TR")) { }
        .environmentObject(ACY_PREVIEWS_STATE)
}
