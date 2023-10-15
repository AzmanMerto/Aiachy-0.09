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
    var titleText: String
    var descriptionText: String?
    
    var body: some View {
        VStack(spacing: 10) {
            //MARK: authTitleAndDescription - Title for all Auth
            Text(titleText.locale())
                .font(.aiachyFont(.cinzelBlack20))
                .foregroundColor(Color.AiachyColor(aiachyState, aiachyColor: .firstColor))
            if isHaveDescription {
                //MARK: authTitleAndDescription - Description for all Auth
                Text(descriptionText!.locale())
                    .font(.aiachyFont(.oldItalic14))
                    .foregroundColor(Color.AiachyColor(aiachyState, aiachyColor: .secondColor))
            }
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
        .frame(height: ACYdh(aiachyState, d: isHaveDescription ? ACY_SML_SIZE : ACY_MIN_SIZE))
        .makeAccessibilitysForUITest(identifier: "ACYTitleAndDescriptionTextID")

    }
}

struct AuthTitleAndDescription_Previews: PreviewProvider {
    static var previews: some View {
        ACYTitleAndDescriptionText(titleText: "Title Text",
                                   descriptionText: "Description")
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}
