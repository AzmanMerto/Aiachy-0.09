//
//  ThemeView.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import SwiftUI
//MARK: ThemeView - View
struct ThemeView: View {
    
    @StateObject var presenter: ThemePresenter
    let aiachyState: AiachyState
    let router: SettingsRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: SettingsRouterPresenter) {
        self._presenter = StateObject(wrappedValue: ThemePresenter(aiachy: aiachyState,
                                                                   router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                //MARK: ThemeView - backButton
                backButton
                TabView(selection: $presenter.currentIndex.animation(.linear),content:  {
                    Image(ImageHandler.makeSettingsThemeString(aiachyState,theme: .themeLight))
                        .tag(0)
                        .onTapGesture {
                            presenter.changeTheme(theme: "Light")
                        }
                    Image(ImageHandler.makeSettingsThemeString(aiachyState,theme: .themeDark))
                        .tag(1)
                        .onTapGesture {
                            presenter.changeTheme(theme: "Dark")
                        }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                Spacer()
                
            }
        }
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
//MARK: ThemeView - Preview
#Preview {
    ThemeView(aiachy: ACY_PREVIEWS_STATE, router: SettingsRouterPresenter())
}
 */
//MARK: ThemeView - extension
extension ThemeView {
    //MARK: ThemeView - backButton
    var backButton: some View {
        ZStack{
            ACYViewTitleText(title: TextHandler.makeSettingsString(aiachy: aiachyState,
                                                                   settings: .themeTitle))
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
    
}
