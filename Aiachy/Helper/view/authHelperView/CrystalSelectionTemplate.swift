//
//  CrystalSelectionTemplate.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

struct CrystalSelectionTemplate: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var selected: TextHelper.SpiritualCompletion.crystalName?
    let entity: CrystalSelectEntity
    
    var body: some View {
        VStack(spacing: 5) {
            //MARK: CrystalSelectionTemplate - circle & image
            circledImage
            //MARK: CrystalSelectionTemplate - Name & Date Text
            nameAndDate
        }
        .onTapGesture {
            if !(selected == entity.name) {
                withAnimation(.linear) {
                    selected = entity.name
                }
            }
        }
        .frame(width: ACYdw(aiachyState, d: 0.25))
        .makeAccessibilitysForUITest(identifier: "\(entity.name)SelectionTemplateID")
        .environmentObject(aiachyState)
    }
}
//MARK: - CrystalSelectionTemplate - previews -
#Preview {
    CrystalSelectionTemplate(selected: .constant(.capricornCrystal),
                            entity: CrystalSelectEntity(id: 0,
                                                        image: .aquariusCrystal,
                                                        name: .capricornCrystal,
                                                        date: .aquariusZodiacDate))
    .environmentObject(ACY_PREVIEWS_STATE)
}
//MARK -: CrystalSelectionTemplate - extension -
extension CrystalSelectionTemplate {
    @ViewBuilder
    private var circledImage: some View {
        Circle()
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                                                aiachyColor: (selected != entity.name) ? .backgroundAlternativeColor : .firstColor)))
            .overlay { convertSelectedImage }
            .background { backgroundCircle }
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.18))
        
    }
    
    
    private var backgroundCircle: some View {
        Circle()
            .stroke(.black.opacity(0.2))
            .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.18))
    }
    
    private var nameAndDate: some View {
        VStack(spacing: 5) {
            Text(TextHandler.makeCrystalZodiacString(aiachy: aiachyState,
                                                     crystal: entity.name))
            .font(FontHandler.aiachyFont(.roundedMedium12))
            Text(TextHandler.makeDateZodiacString(aiachy: aiachyState,
                                                  date: entity.date))
                .font(FontHandler.aiachyFont(.oldItalic12))
        }
        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)))
    }
}

//MARK: CrystalSelectionTemplate - extension
extension CrystalSelectionTemplate {
    @ViewBuilder
    private var convertSelectedImage: some View {
        if selected != entity.name {
            Image(ImageHandler.makeCrystalZodiacString(aiachyState,
                                                       crystal: entity.image))
                .resizable()
                .scaledToFit()
                .frame(width: ACYdw(aiachyState, d: 0.08))
        } else {
            Image(ImageHandler.makeCrystalZodiacString(aiachyState,
                                                       crystal: entity.image))
                .resizable()
                .scaledToFit()
                .frame(width: ACYdw(aiachyState, d: 0.09))
        }
    }
    
}
