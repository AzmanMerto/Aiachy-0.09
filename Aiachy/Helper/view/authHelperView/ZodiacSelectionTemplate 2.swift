//
//  ZodiacSelectionTemplate.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

struct ZodiacSelectionTemplate: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var selected: String
    let entity: ZodiacSelect
    
    var body: some View {
        
        Button {
            withAnimation(.linear) {
                selected = entity.zodiacName.rawValue
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
        .makeAccessibilitysForUITest(identifier: "\(entity.zodiacName)SelectionTemplateID")
    }
}
//MARK: ZodiacSelectionTemplate - previews
struct ZodiacSelection_Previews: PreviewProvider {
    
    static let data: [ZodiacSelect] = [
        ZodiacSelect(id: 0, zodiacImage: .altAquarius, selectedZodiacImage: .aquarius, zodiacName: .AquariusZodiac, zodiacShortedDate: .AquariusZodiacShortedDate)
    ]
    
    static var previews: some View {
        ZStack {
            Color.AiachyColor(ACY_PREVIEWS_STATE, aiachyColor: .backgroundColor)
                .ignoresSafeArea()
            HStack(spacing: 25, content: {
                ZodiacSelectionTemplate(selected: .constant(ACYTextHelper.ACYZodiacText.ACYzodiacNameText.PiscesZodiac.rawValue), entity: data.first!)
            })
            .environmentObject(ACY_PREVIEWS_STATE)
        }
    }
}

//MARK: ZodiacSelectionTemplate - extension
extension ZodiacSelectionTemplate {
    @ViewBuilder
    private var circledImage: some View {
        Circle()
            .foregroundColor(.AiachyColor(aiachyState,
                                          aiachyColor: (selected != entity.zodiacName.rawValue) ? .backgroundAlternativeColor : .firstColor))
            .overlay {
                convertSelectedImage
            }
            .background {
                Circle()
                    .stroke(.black.opacity(0.2))
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: 0)
            }

            .frame(width: ACYdw(aiachyState, d: 0.20))
    }
    
    private var nameAndDate: some View {
        VStack(spacing: 5) {
            Text(entity.zodiacName.rawValue.locale())
                .font(.aiachyFont(.roundedBold14))
            
            Text(entity.zodiacShortedDate.rawValue.locale())
                .font(.aiachyFont(.oldItalic10))
        }
        .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .firstColor))
    }
}

//MARK: ZodiacSelectionTemplate - extension
extension ZodiacSelectionTemplate {
    
    @ViewBuilder
    private var convertSelectedImage: some View {
        if selected != entity.zodiacName.rawValue {
            Image.setACYZodiacAltImage(aiachyState, zodiacAlt: entity.zodiacImage)
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.1))
        } else {
            Image.setACYZodiacImage(aiachyState, zodiac: entity.selectedZodiacImage)
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.10))
        }
    }
    
}
