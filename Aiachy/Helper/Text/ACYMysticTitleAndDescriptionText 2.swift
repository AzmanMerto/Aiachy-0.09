//
//  ACYMysticTitleAndDescriptionText.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.08.2023.
//

import SwiftUI

struct ACYMysticTitleAndDescriptionText: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    var fontType: FontHandler.aiachyFontType
    var title: TextHelper.MysticCompletion.mystic
    var description: TextHelper.MysticCompletion.mystic
    
    var body: some View {
        VStack {
            Text(TextHandler.makeMysticString(aiachy: aiachyState, mystic: title))
                .font(.aiachyFont(fontType))
                .foregroundStyle(Color.makeAiachyColor(aiachyState, aiachyColor: .secondColor))
            Text(TextHandler.makeMysticString(aiachy: aiachyState, mystic: description))
                .font(.aiachyFont(.oldBold14))
                .foregroundStyle(Color.makeAiachyColor(aiachyState, aiachyColor: .firstColor))
        }
    }
}
// WillAdded:
/*
#Preview {
    ACYMysticTitleAndDescriptionText(fontType: .CinzelBlack50,
                                     title: .tarotTitle,
                                     description: .tarotDescription)
    .environmentObject(ACY_PREVIEWS_STATE)
}
*/
