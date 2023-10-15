//
//  SplashView.swift
//  Aiachy
//
//  Created by Mert Türedü on 13.05.2023.
//

import SwiftUI

struct SplashView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var aiachyState = AiachyState()
    @ObservedObject var presenter = SplashPresenter()
    
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
                    Color.AiachyColor(aiachyState,
                                      aiachyColor: .backgroundColor)
                    .ignoresSafeArea()
                    ACYLoadingProgress()
                }
                .overlay {
                    if presenter.isShowingACYAlert ?? false {
                        ACYAlertView(alertTitle: presenter.alertTitle!,
                                     alertImage: presenter.alertImage,
                                     isNeedImage: presenter.isNeedImage!,
                                     isNeedSecondButton: false,
                                     alertFirstButtonText: presenter.alertFirstButtonText!) {
                            presenter.definitionErrorAction(colorScheme: colorScheme, aiachy: aiachyState)
                        }
                    }
                }
            }
        }
        .onAppear {
            presenter.startApp(colorScheme: colorScheme, aiachy: aiachyState)
        }
        .environmentObject(aiachyState)
    }
}

struct SplashView_Previews: PreviewProvider {
    
    static let aiachyState = ACY_PREVIEWS_STATE
    
    static var previews: some View {
        SplashView()
            .environmentObject(aiachyState)
            
    }
}
