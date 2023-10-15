//
//  LoveView.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import SwiftUI
//MARK: LoveView - View
struct LoveView: View {
    
    @StateObject var presenter: LovePresenter
    var aiachyState: AiachyState
    let router: LoveRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         homeRouter: HomeRouterPresenter,
         router: LoveRouterPresenter) {
        self._presenter = StateObject(wrappedValue: LovePresenter(aiachyState: aiachyState,
                                                                 homeRouter: homeRouter,
                                                                 router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack(spacing: 20){
                //MARK: LoveView - Tittle
                ACYTitleAndDescriptionText(isHaveDescription: false,
                                           title: TextHandler.makeLoveString(aiachy: aiachyState,
                                                                             love: .attentionTitle))
                //MARK: LoveView - Attention Image
                Image(ImageHandler.makeLoveString(aiachyState,
                                                  love: .loveAttention))
                .resizable()
                .scaledToFit()
                .padding(.all)
                button
            }
        }
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
//MARK: LoveView - Preview
#Preview {
    LoveView(aiachy: ACY_PREVIEWS_STATE,homeRouter: HomeRouterPresenter(), router: LoveRouterPresenter())
}
*/
extension LoveView {
    var button: some View {
        //MARK: LoveView - Button
        ACYButton(text: .preRegistration) {
            presenter.makeAlert()
        }
    }
}
