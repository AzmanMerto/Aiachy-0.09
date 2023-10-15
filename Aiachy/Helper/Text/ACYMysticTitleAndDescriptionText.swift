//
//  ACYMysticTitleAndDescriptionText.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.08.2023.
//

import SwiftUI

struct ACYMysticTitleAndDescriptionText: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    var fontType: FontHelper.aiachyFontType
    var title: TextHelper.MysticCompletion.mystic
    var description: TextHelper.MysticCompletion.mystic
    
    var body: some View {
        VStack {
            Text(TextHandler.makeMysticString(aiachy: aiachyState, mystic: title))
                .font(FontHandler.aiachyFont(fontType))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .secondColor)))
            Text(TextHandler.makeMysticString(aiachy: aiachyState, mystic: description))
                .font(FontHandler.aiachyFont(.oldBold14))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)))
        }
    }
}
#Preview {
    ACYMysticTitleAndDescriptionText(fontType: .CinzelBlack50,
                                     title: .tarotTitle,
                                     description: .tarotDescription)
    .environmentObject(ACY_PREVIEWS_STATE)
}
