//
//  ACYHomeImage.swift
//  Aiachy
//
//  Created by Mert Türedü on 26.08.2023.
//

import SwiftUI
//MARK: - ACYHomeImage - View -
struct ACYHomeImage: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var currentTime: TextHelper.HomeCompletion.date
    let compatibilityEntity: [ACYCompatibilityEntity]
    
    init(currentTime: Binding<TextHelper.HomeCompletion.date>,
         compatibilityEntity: [ACYCompatibilityEntity]) {
        self._currentTime = currentTime
        self.compatibilityEntity = compatibilityEntity
    }
    
    var body: some View {
        Image(ImageHandler.makeHomeString(aiachyState, home: .topImage))
            .resizable()
            .scaledToFill()
            .overlay{ Color.black.opacity(0.2)}
            .frame(width: ACYdw(aiachyState, d: 1.01),height: ACYdh(aiachyState, d: 0.21))
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        //MARK: TopImage - title
                        title
                        //MARK: TopImage - compatibilityZodiacs
                        compatibilityZodiacs
                    }
                    .padding(.all)
                    Spacer()
                }
            }
            .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
//MARK: - ACYHomeImage - Preview -
#Preview("ACYHomeImage") {
    ACYHomeImage(currentTime: .constant(.today),
                 compatibilityEntity: ACY_COMPATIBILITY_ENTITY_TODAY)
    .environmentObject(ACY_PREVIEWS_STATE)
}
 */
//MARK: - ACYHomeImage - extension -
extension ACYHomeImage {
    //MARK: ACYHomeImage - title
    private var title: some View {
        HStack {
            Text(TextHandler.makeHomeDateString(aiachy: aiachyState, date: currentTime))
            Text(TextHandler.makeHomeString(aiachy: aiachyState, home: .compatibility))
        }
        .padding(.horizontal,5)
        .font(.aiachyFont(.roundedBold14))
        .foregroundStyle(Color.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor))
    }
    @ViewBuilder
    //MARK: ACYHomeImage - compatibilityZodiacs
    private var compatibilityZodiacs: some View {
        HStack {
            ForEach(compatibilityEntity, id: \.zodiac) { compatibility in
                compatibilityZodiac(compatibility: compatibility.zodiac)
            }
        }
    }
    //MARK: ACYHomeImage - compatibilityZodiacBackground
    private func compatibilityZodiac(compatibility compatibilityInt: Int) -> some View {
        compatibilityZodiacBackground
            .overlay {
                HStack(spacing:10) {
                    compatibilityZodiacImage(compatibilityInt: compatibilityInt)
                    compatibilityZodiacText(compatibilityInt: compatibilityInt)
                }
                .frame(width: ACYdw(aiachyState, d: 0.27), height: ACYdh(aiachyState, d: 0.05))
            }
    }
    //MARK: ACYHomeImage - compatibilityZodiacImage
    private func compatibilityZodiacImage(compatibilityInt: Int) -> some View {
        makeImageWithZodiacInt(aiachy: aiachyState, zodiac: compatibilityInt)
            .resizable()
            .scaledToFit()
            .frame(height: ACYdh(aiachyState, d: 0.025))
            .background {
                Circle()
                    .stroke(Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor),lineWidth: 0.3)
                    .frame(width: ACYdh(aiachyState, d: 0.04),height: ACYdh(aiachyState, d: 0.04))
            }
            .frame(width: ACYdh(aiachyState, d: 0.04),height: ACYdh(aiachyState, d: 0.04))
    }
    //MARK: ACYHomeImage - compatibilityZodiacText
    private func compatibilityZodiacText(compatibilityInt: Int) -> some View {
        Text(TextHandler.makeTextWithZodiacInt(aiachy: aiachyState, zodiac: compatibilityInt))
            .font(.aiachyFont(.roundedMedium12))
            .foregroundStyle(Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
    }
    //MARK: ACYHomeImage - compatibilityZodiacBackground
    private var compatibilityZodiacBackground: some View {
        RoundedRectangle(cornerRadius: 36)
            .stroke(Color.makeAiachyColor(aiachyState, aiachyColor: .secondColor), lineWidth: 1)
            .background{ 
                Color.makeAiachyColor(aiachyState,
                                      aiachyColor: .backgroundAlternativeColor).cornerRadius(36)
                    .frame(width: ACYdw(aiachyState, d: 0.28),
                           height: ACYdh(aiachyState, d: 0.05))
                .scaledToFit()}
            .frame(width: ACYdw(aiachyState, d: 0.28), height: ACYdh(aiachyState, d: 0.05))
    }
    
}
