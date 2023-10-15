//
//  MeditationView.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.08.2023.
//

import SwiftUI
//MARK: MeditationView - View
struct MeditationView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let router: GalaxyRouterPresenter
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                //MARK: MeditationView - backButton
                backButton
                Spacer()
                Image(ImageHandler.makeGalaxyString(aiachyState, galaxy: .maditationLogo))
                    .resizable()
                    .scaledToFit()
                    .frame(width: ACYdw(aiachyState, d: 0.7))
                    .opacity(0.6)
                    .padding(.vertical)
                //NextPatchTODO: will be deleted
                Text(TextHandler.makeMysticString(aiachy: aiachyState, mystic: .palmistyrDescription))
                    .font(.aiachyFont(.cinzelBlack22))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                    .opacity(0.8)
                Spacer()
            }
        }
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
#Preview {
    MeditationView(router: GalaxyRouterPresenter())
        .environmentObject(ACY_PREVIEWS_STATE)
}
*/
extension MeditationView {
    //MARK: MeditationView - backButton
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
}
