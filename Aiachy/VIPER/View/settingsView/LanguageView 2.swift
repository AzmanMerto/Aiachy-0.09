//
//  LanguageView.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import SwiftUI

struct LanguageView: View {
    
    @StateObject var presenter: LanguagePresenter
    let aiachyState: AiachyState
    let router: SettingsRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: SettingsRouterPresenter) {
        self._presenter = StateObject(wrappedValue: LanguagePresenter(aiachyState: aiachyState,
                                                                      router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                //MARK: LanguageView - backButton -
                backButton
                //MARK: LanguageView - separator -
                separator(with: .currentLanguage)
                //MARK: LanguageView - LanguageColumn -
                LanguageColumn(entity: presenter.currentLanguage!)
                {  }
                //MARK: LanguageView - separator -
                separator(with: .otherLanguage)
                //MARK: LanguageView - otherLanguage -
                otherLanguage
                Spacer()
            }
        }
        
        .environment(\.locale, Locale.current)
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
#Preview {
    LanguageView(aiachy: ACY_PREVIEWS_STATE, router: SettingsRouterPresenter())
}
*/
extension LanguageView {
    //MARK: LanguageView - backButton -
    private var backButton: some View {
            ZStack{
                ACYViewTitleText(title: TextHandler.makeSettingsString(aiachy: aiachyState,
                                                                       settings: .languageTitle))
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
    //MARK: LanguageView - separator -
    private func separator(with text: TextHelper.SettingsCompletion.language) -> some View {
        let lineWidth = ACYdw(aiachyState, d: 0.15)
        
        return HStack {
            Rectangle()
                .frame(width: lineWidth,height: 1)
            Text(TextHandler.makeSettingsLanguageString(aiachy: aiachyState, language: text))
                .font(.aiachyFont(.roundedBold14))
                .padding(.horizontal)
            Rectangle()
                .frame(width: lineWidth,height: 1)
        }
        .foregroundStyle(Color.makeAiachyColor(aiachyState, aiachyColor: .thirdColor))
    }
    //MARK: LanguageView - otherLanguage -
    var otherLanguage: some View {
        ScrollView(.vertical,showsIndicators: false) {
            ForEach(presenter.filterACYLanguageEntityData(), id:\.id) { language in
                LanguageColumn(entity: language) { presenter.updateAiachyState(entity: language) }
            }
        }
    }
}
