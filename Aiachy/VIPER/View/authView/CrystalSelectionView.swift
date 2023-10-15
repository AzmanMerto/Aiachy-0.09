//
//  CrystalSelectionView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
//MARK: - CrystalSelectionView - View -
struct CrystalSelectionView: View {
    
    @StateObject var presenter: CrystalSelectionPresenter
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    
    init(aiachy aiachyState: AiachyState, 
         router: AuthRouterPresenter) {
        self._presenter = StateObject(wrappedValue: CrystalSelectionPresenter(aiachy: aiachyState,
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
//MARK: - CrystalSelectionView - Previews -
#Preview {
    CrystalSelectionView(aiachy: ACY_PREVIEWS_STATE,
                        router: AuthRouterPresenter())
}
//MARK: - CrystalSelectionView - extension -
extension CrystalSelectionView {
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
    //MARK: CrystalSelectionView - Title
    private var title: some View {
        ACYTitleAndDescriptionText(isHaveDescription: false,
                                   title: TextHandler.makeAuthTitleString(aiachy: aiachyState,
                                                                          title: .crystalSelectionTitle))
    }
    //MARK: CrystalSelectionView - Zodiac Selections
    private var zodiacs: some View {
        LazyVGrid(columns: presenter.columns) {
            ForEach(presenter.zodiacSelectEntity, id: \.id) { entity in
                CrystalSelectionTemplate(selected: $presenter.selectedCrystalName,
                                        entity: entity)
                .padding(.bottom,5)
            }
        }
    }
    //MARK: CrystalSelectionView - Zodiac Continue Button
    private var continueButton: some View {
        ACYButton(text: .continue) {
            self.aiachyState.user.userSpiritual.zodiac = presenter.selectedZodiacToInt(selectedZodiac: presenter.selectedCrystalName!)
            
            if aiachyState.isGuest {
                router.isUserComplateAuthCompletion = true
            } else {
                router.navigate(to: .registerView)
            }
        }
        .disabledOpacited(bool: (presenter.selectedCrystalName == nil),
                          disabledOpacity: 0.3)
    }
}
