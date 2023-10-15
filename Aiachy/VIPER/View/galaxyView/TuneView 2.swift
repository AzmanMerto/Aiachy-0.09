//
//  TuneView.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.08.2023.
//

import SwiftUI
//MARK: TuneView - View
struct TuneView: View {
    
    @StateObject var presenter: TunePresenter
    var aiachyState: AiachyState
    let router: GalaxyRouterPresenter

    init(aiachy aiachyState: AiachyState,
        router: GalaxyRouterPresenter) {
        self.aiachyState = aiachyState
        self.router = router
        self._presenter = StateObject(wrappedValue: TunePresenter(aiachyState: aiachyState))
    }

    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                //MARK: TuneView - backButton
                backButton
                //MARK: TuneView - tunes
                tunes
            }
        }
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
#Preview {
    TuneView(aiachy: ACY_PREVIEWS_STATE, router: GalaxyRouterPresenter())
}
*/
extension TuneView {
    //MARK: TuneView - backButton
    private var backButton: some View {
            ZStack{
                ACYViewTitleText(title: TextHandler.makeGalaxy(aiachy: aiachyState,
                                                               galaxy: .tuneTitle))
                HStack {
                    ACYPassButton(isItBackButton: true, text: .back) {
                        router.navigate(to: .galaxy)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.all)
    }
    //MARK: TuneView - tunes
    private var tunes: some View {
        ScrollView(.vertical,showsIndicators: false) {
            ForEach(presenter.acyTuneEntityData ?? [], id: \.determinedZodiac) { tune in
                withAnimation(.spring()) {
                    TuneColumn(playingTune: $presenter.playingTune,
                               acyTuneEntity: tune)
                    { presenter.actionTuneColumn(entity: tune)  }
                }
            }
        }
    }
}
