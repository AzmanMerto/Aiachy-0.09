//
//  ACYTitleAndDescriptionText.swift
//  Aiachy
//
//  Created by Mert Türedü on 20.07.2023.
//

import SwiftUI

struct ACYTitleAndDescriptionText: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var isHaveDescription: Bool = true
    var title: String
    var description: String?
    
    var body: some View {
        LazyVStack(spacing: 10) {
            //MARK: authTitleAndDescription - Title for all Auth
            Text(title)
                .font(FontHandler.aiachyFont(.cinzelBlack20))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)))
                .frame(width: ACYdw(aiachyState, d: 0.9))
            if isHaveDescription {
                //MARK: authTitleAndDescription - Description for all Auth
                Text(description!)
                    .font(FontHandler.aiachyFont(.oldRegular13))
                    .foregroundColor(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .secondColor)))
                    .frame(width: ACYdw(aiachyState, d: 0.9))
            }
        }
        .multilineTextAlignment(.center)
        .makeAccessibilitysForUITest(identifier: "ACYTitleAndDescriptionTextID")

    }
}

struct AuthTitleAndDescription_Previews: PreviewProvider {
    static var previews: some View {
        ACYTitleAndDescriptionText(title: "Title Text",
                                   description: "Description Text")
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}
