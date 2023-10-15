//
//  OnboardingView.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI
import MessageUI

struct OnboardingView: View {
    
    @StateObject var presenter: OnboardingPresenter
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter) {
        self._presenter = StateObject(wrappedValue: OnboardingPresenter(aiachy: aiachyState,
                                                                        router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
            VStack {
                //MARK: OnboardingView - Onboarding Value
                ACYAuthOnboardingView(selection: $presenter.currentIndex,
                              acyAuthOnboardingEntityData: presenter.acyOnboardingEntityData)
                .tabViewStyle(.page(indexDisplayMode: .never))
                //MARK: OnboardingView - Page Index
                pageIndex
                //MARK: OnboardingView - Button
                navigateToLoginButton
                .padding(.vertical)
                //MARK: OnboardingView - privacyPolicy
                privacyPolicy
            }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "OnboardingViewID")
    }
}

#Preview {
    OnboardingView(aiachy: ACY_PREVIEWS_STATE, router: AuthRouterPresenter())
}
//MARK: OnboardingView - extensions
extension OnboardingView {
    //MARK: OnboardingView - Page Index
    @ViewBuilder
    private var pageIndex: some View {
        HStack {
            ForEach(0..<presenter.acyOnboardingEntityData.count, id: \.self) { index in
                if index == presenter.currentIndex {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 20)
                        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                                           aiachyColor: .firstColor)))
                } else {
                    Circle()
                        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                                           aiachyColor: .secondColor)))
                }
            }
        }
        .foregroundColor(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .secondColor)))
        .frame(width: ACYdw(aiachyState, d: 0.15),height: 5)
    }
    //MARK: OnboardingView - Button
    private var navigateToLoginButton: some View {
        ACYButton(text: .continue) {
            withAnimation(.linear(duration: ACY_MIN_TIME)) {
                if presenter.currentIndex < presenter.acyOnboardingEntityData.count - 1 {
                    presenter.currentIndex += 1
                } else {
                    router.navigate(to: .loginView)
                }
            }
        }
    }
    //MARK: OnboardingView - privacyPolicy
    private var privacyPolicy: some View {
        Text(TextHandler.makeAuthHelperAuthString(aiachy: aiachyState, helperAuth: .privacyPolicy))
            .makeAccessibilitysForUITest(identifier: "PrivacyPolicyButtonID")
            .multilineTextAlignment(.center)
            .padding(.horizontal,ACYdw(aiachyState, d: ACY_SML_SIZE))
            .font(FontHandler.aiachyFont(.roundedRegular10))
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)))
    }
}

