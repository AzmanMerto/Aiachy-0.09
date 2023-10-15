//
//  AicyCashView.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import SwiftUI

struct AicyCashView: View {
    
    @StateObject var presenter: AicyCashPresenter
    let aiachyState: AiachyState
    let router: SettingsRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: SettingsRouterPresenter) {
        self._presenter = StateObject(wrappedValue: AicyCashPresenter(aiachyState: aiachyState))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                backButton
                Spacer()
                Image(ImageHandler.makeSettingsAicyCashString(aiachyState,
                                                              aicyCash: .aicyCashBackground))
                    .scaledToFit()
                    .padding(.vertical)
                //NextPatchTODO: will be deleted
                Text(TextHandler.makeMysticString(aiachy: aiachyState, mystic: .palmistyrDescription))
                    .font(FontHandler.aiachyFont(.cinzelBlack22))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor)))
                    .opacity(0.8)
                Spacer()
            }
        }
        .environmentObject(aiachyState)
    }
}

#Preview {
    AicyCashView(aiachy: ACY_PREVIEWS_STATE, router: SettingsRouterPresenter())
}

extension AicyCashView {
    //MARK: AicyCashView - backButton
    var backButton: some View {
            ZStack{
                ACYViewTitleText(title: TextHandler.makeSettingsString(aiachy: aiachyState, settings: .aicyCashTitle))
                HStack {
                    ACYPassButton(isItBackButton: true, text: .back) {
                        router.navigate(to: .settings)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.all)
    }
}
