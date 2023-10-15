//
//  SplashView.swift
//  Aiachy
//
//  Created by Mert Türedü on 13.05.2023.
//

import SwiftUI

struct SplashView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var aiachyState: AiachyState
    @StateObject var presenter: SplashPresenter
    
    init(aiachyState: AiachyState = AiachyState() ) {
        self._aiachyState = StateObject(wrappedValue: aiachyState)
        self._presenter = StateObject(wrappedValue: SplashPresenter(aiachy: aiachyState))
    }
    
    var body: some View {
        ZStack {
            if presenter.isCurrentUser {
                //MARK: SplashView - Navigate to Homeview (Current user routering to Mainview)
                HomeRouter()
            } else if presenter.isNewUser {
                //MARK: SplashView - Navigate to Onboarding (New user routering to onboarding)
                AuthRouter()
                
            } else {
                //MARK: SplashView - Show to
                ZStack {
                    Color.makeAiachyColor(aiachyState,
                                      aiachyColor: .backgroundColor)
                    .ignoresSafeArea()
                    ACYLoadingProgress()
                }
                .overlay {
                    if presenter.acyAlertEntity.isShowingAlert {
                        ACYAlertView(acyAlertEntity: presenter.acyAlertEntity) 
                    }
                }
            }
        }
        .onAppear {
            presenter.startApp(colorScheme: colorScheme)
        }
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
#Preview {
    SplashView(aiachyState: ACY_PREVIEWS_STATE)
}
*/
