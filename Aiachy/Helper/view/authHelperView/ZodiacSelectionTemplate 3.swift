//
//  ZodiacSelectionTemplate.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

struct ZodiacSelectionTemplate: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var selected: TextHelper.ZodiacCompletion.zodiac?
    let entity: ZodiacSelect
    
    var body: some View {
        
        Button {
            withAnimation(.linear) {
                selected =  entity.zodiacName
            }
        } label: {
            VStack(spacing: 5) {
                //MARK: ZodiacSelectionTemplate - circle & image
                circledImage
                //MARK: ZodiacSelectionTemplate - Name & Date Texts
                nameAndDate
            }
        }
        .environmentObject(aiachyState)
        .frame(height: ACYdh(aiachyState, d: 0.14))
        .makeAccessibilitysForUITest(identifier: "\(entity.zodiacName)SelectionTemplateID")
    }
}
// WillAdded:
/*
//MARK: ZodiacSelectionTemplate - previews
#Preview {
    ZodiacSelectionTemplate(selected: .constant(.ariesZodiacName),
                            entity: ZodiacSelect(id: 0, zodiacImage: .altAquarius,
                                                               selectedZodiacImage: .aquarius,
                                                               zodiacName: .aquariusZodiacDate,
                                                               zodiacShortedDate: .aquariusZodiacDate))
    .environmentObject(ACY_PREVIEWS_STATE)
}
*/
//MARK: ZodiacSelectionTemplate - extension
extension ZodiacSelectionTemplate {
    @ViewBuilder
    private var circledImage: some View {
        Circle()
            .foregroundColor(.makeAiachyColor(aiachyState,
                                          aiachyColor: (selected != entity.zodiacName) ? .backgroundAlternativeColor : .firstColor))
            .overlay {
                convertSelectedImage
            }
            .background {
                Circle()
                    .stroke(.black.opacity(0.2))
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
            }
    }
    
    private var nameAndDate: some View {
        VStack(spacing: 5) {
            Text(TextHandler.makeZodiacString(aiachy: aiachyState, zodiac: entity.zodiacName))
                .font(.aiachyFont(.roundedBold14))
            
            Text(TextHandler.makeZodiacString(aiachy: aiachyState, zodiac: entity.zodiacShortedDate))
                .font(.aiachyFont(.oldItalic10))
        }
        .foregroundColor(.makeAiachyColor(aiachyState, aiachyColor: .firstColor))
    }
}

//MARK: ZodiacSelectionTemplate - extension
extension ZodiacSelectionTemplate {
    
    @ViewBuilder
    private var convertSelectedImage: some View {
        if selected != entity.zodiacName {
            Image(ImageHandler.makeZodiacString(aiachyState, zodiac: entity.zodiacImage))
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.1))
        } else {
            Image(ImageHandler.makeZodiacString(aiachyState, zodiac: entity.selectedZodiacImage))
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.10))
        }
    }
    
}
