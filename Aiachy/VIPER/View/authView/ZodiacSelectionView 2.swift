//
//  ZodiacSelectionView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
//MARK: ZodiacSelectionView - View
struct ZodiacSelectionView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @ObservedObject var presenter = ZodiacSelectionPresenter()
    let router: AuthRouterPresenter
    
    var body: some View {
        VStack {
            //MARK: ZodiacSelectionView - Back Button
            backButton
            //MARK: ZodiacSelectionView - Title
            title
            Spacer()
            //MARK: ZodiacSelectionView - Zodiac Selections
            zodiacs
            Spacer()
            //MARK: ZodiacSelectionView - Zodiac Continue Button
            continueButton
        }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ZodiacSelectionViewID")
    }
}
//MARK: ZodiacSelectionView - Previews
struct ZodiacSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AuthBackground()
            ZodiacSelectionView(router: AuthRouterPresenter())
        }
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}
//MARK: ZodiacSelectionView - extension
extension ZodiacSelectionView {
    //MARK: ZodiacSelectionView - Back Button
    private var backButton: some View {
        HStack(alignment: .firstTextBaseline) {
            ACYPassButton(isItBackButton: true,
                          text: ACYTextHelper.ACYAppText.ACYappButtonText.BackButton.rawValue) {
                if aiachyState.isGuest {
                    router.navigate(to: .loginView)
                    aiachyState.isGuest = false
                } else {
                    router.navigate(to: .loginView)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    //MARK: ZodiacSelectionView - Title
    private var title: some View {
        ACYTitleAndDescriptionText(isHaveDescription: false,
                                   titleText: ACYTextHelper.ACYAuthText.ACYauthTitleText.ZodiacSelectionViewTitle.rawValue)
    }
    //MARK: ZodiacSelectionView - Zodiac Selections
    private var zodiacs: some View {
        LazyVGrid(columns: presenter.columns, spacing: 10) {
            ForEach(presenter.zodiacSelectEntity, id: \.id) { entity in
                ZodiacSelectionTemplate(selected: $presenter.selectedZodiac,
                                entity: entity)
            }
        }
    }
    //MARK: ZodiacSelectionView - Zodiac Continue Button
    private var continueButton: some View {
        ACYButton(text: ACYTextHelper.ACYAppText.ACYappButtonText.ContinueButton.rawValue) {
            self.aiachyState.user.userZodiac.zodiac = presenter.selectedZodiacToInt(selectedZodiac: presenter.selectedZodiac)
            if aiachyState.isGuest {
                router.isUserComplateAuthCompletion = true
            } else {
                router.navigate(to: .registerView)
            }
        }
        .disabledOpacited(bool: (presenter.selectedZodiac.isEmpty != false),
                          disabledOpacity: 0.3)
    }
}
