//
//  ZodiacSelectionView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
//MARK: ZodiacSelectionView - View
struct ZodiacSelectionView: View {
    
    @StateObject var presenter: ZodiacSelectionPresenter
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    
    init(aiachy aiachyState: AiachyState, 
         router: AuthRouterPresenter) {
        self._presenter = StateObject(wrappedValue: ZodiacSelectionPresenter(aiachy: aiachyState,
                                                                             router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    
    var body: some View {
        VStack {
            //MARK: ZodiacSelectionView - Back Button
            backButton
            //MARK: ZodiacSelectionView - Title
            title
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
// WillAdded:
/*
//MARK: ZodiacSelectionView - Previews
#Preview {
    ZodiacSelectionView(aiachy: ACY_PREVIEWS_STATE,
                        router: AuthRouterPresenter())
}
 */
//MARK: ZodiacSelectionView - extension
extension ZodiacSelectionView {
    //MARK: ZodiacSelectionView - Back Button
    private var backButton: some View {
        HStack {
            ACYPassButton(isItBackButton: true,
                          text: .back) {
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
                                   title: TextHandler.makeAuthString(aiachy: aiachyState, auth: .zodiacSelectionTitle))
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
        ACYButton(text: .continue) {
            self.aiachyState.user.userZodiac.zodiac = presenter.selectedZodiacToInt(selectedZodiac: presenter.selectedZodiac!)
            
            if aiachyState.isGuest {
                router.isUserComplateAuthCompletion = true
            } else {
                router.navigate(to: .registerView)
            }
        }
        .disabledOpacited(bool: (presenter.selectedZodiac == nil),
                          disabledOpacity: 0.3)
    }
}
