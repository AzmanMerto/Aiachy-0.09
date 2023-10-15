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
            .font(.aiachyFont(.roundedBold20))
            .foregroundStyle(Color.makeAiachyColor(aiachyState,
                                                   aiachyColor: .firstColor))
            .multilineTextAlignment(.center)
    }
}
// WillAdded:
/*
#Preview {
    ACYViewTitleText(title: "Title")
}
*/
