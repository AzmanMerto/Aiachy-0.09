//
//  ACYViewTitleText.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.08.2023.
//

import SwiftUI

struct ACYViewTitleText: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let title: String
    
    var body: some View {
        Text(title)
            .font(FontHandler.aiachyFont(.roundedBold20))
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                                   aiachyColor: .firstColor)))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    ACYViewTitleText(title: "Title")
}
