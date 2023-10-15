//
//  GalaxyView.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import SwiftUI

struct GalaxyView: View {
    
    @ObservedObject var presenter: GalaxyPresenter
    let aiachyState: AiachyState
    let router: GalaxyRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: GalaxyRouterPresenter) {
        self.aiachyState = aiachyState
        self.presenter = GalaxyPresenter(aiachyState: aiachyState)
        self.router = router
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                LazyVGrid(columns: presenter.columns, content: {
                    GalaxyColumn(title: .tuneTitle,
                                     image: .tuneLogo) {
                        router.navigate(to: .tune)
                    }
                    GalaxyColumn(title: .meditationTitle, 
                                     image: .maditationLogo) {
                        router.navigate(to: .meditation)
                    }
                    
                })
                Spacer()
            }
            .environmentObject(aiachyState)
        }
    }
}

struct GalaxyView_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyView(aiachy: ACY_PREVIEWS_STATE, router: GalaxyRouterPresenter())
    }
}
