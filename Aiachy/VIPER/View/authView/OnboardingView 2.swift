//
//  OnboardingView.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI
import MessageUI

struct OnboardingView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @ObservedObject var presenter = OnboardingPresenter()
    let router: AuthRouterPresenter
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                //MARK: OnboardingView - Onboarding Value
                ACYOnboarding(selection: $presenter.currentIndex,
                              OnboardingItems: presenter.onboardingItems)
                .tabViewStyle(.page(indexDisplayMode: .never))
                Spacer()
                //MARK: OnboardingView - Page Index
                pageIndex
                //MARK: OnboardingView - Button
                navigateToLoginButton
                .padding(.vertical)
                //MARK: OnboardingView - PrivacyPolicy Way
                privacyPolicyButton
                    .onTapGesture {
                        router.navigate(to: .privacyPolicyView)
                    }
                Spacer()
            }
        }
        .makeAccessibilitysForUITest(identifier: "OnboardingViewID")
        .environmentObject(aiachyState)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    
    static var previews: some View {
            OnboardingView(router: AuthRouterPresenter())
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}

//MARK: OnboardingView - extensions
extension OnboardingView {
    //MARK: OnboardingView - Page Index
    @ViewBuilder
    private var pageIndex: some View {
        HStack {
            ForEach(0..<presenter.onboardingItems.count, id: \.self) { index in
                if index == presenter.currentIndex {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 20)
                        .foregroundColor(Color.AiachyColor(aiachyState,
                                                           aiachyColor: .firstColor))
                } else {
                    Circle()
                        .foregroundColor(Color.AiachyColor(aiachyState,
                                                           aiachyColor: .secondColor))
                }
            }
        }
        .foregroundColor(Color.AiachyColor(aiachyState, aiachyColor: .secondColor))
        .frame(width: ACYdw(aiachyState, d: 0.15),height: 5)
    }
    //MARK: OnboardingView - Button
    private var navigateToLoginButton: some View {
        ACYButton(text: ACYTextHelper.ACYAppText.ACYappButtonText.ContinueButton.rawValue) {
            withAnimation(.linear(duration: ACY_MIN_TIME)) {
                if presenter.currentIndex < presenter.onboardingItems.count - 1 {
                    presenter.currentIndex += 1
                } else {
                    router.navigate(to: .loginView)
                }
            }
        }
    }
    //MARK: OnboardingView - PrivacyPolicy Way
    private var privacyPolicyButton: some View {
        Text(ACYTextHelper.ACYAuthText.ACYprivacyPolicyText.PrivacyTermWay.rawValue.locale())
            .makeAccessibilitysForUITest(identifier: "PrivacyPolicyButtonID")
            .multilineTextAlignment(.center)
            .padding(.horizontal,ACYdw(aiachyState, d: ACY_SML_SIZE))
            .font(.aiachyFont(.roundedRegular10))
            .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .firstColor))
    }
}

