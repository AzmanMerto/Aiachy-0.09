//
//  OnboardingPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import Foundation

class OnboardingPresenter: ObservableObject {
    
    @Published var currentIndex: Int
    let aiachyState = AiachyState()
    
    init(currentIndex: Int = 0) {
        self.currentIndex = currentIndex
    }
    
    let onboardingItems: [Onboarding] = [
        Onboarding(id: 0,
                   onboardingImage: .authHeart,
                   onboardingTitle: ACYTextHelper.ACYOnboardingText.ACYonboardingTitleText.HeartofAstrologyViewTitle.rawValue,
                   onboardingDescription: ACYTextHelper.ACYOnboardingText.ACYonboardingDescriptionText.HeartofAstrologyViewDescription.rawValue),
        Onboarding(id: 1,
                   onboardingImage: .secretStar,
                   onboardingTitle: ACYTextHelper.ACYOnboardingText.ACYonboardingTitleText.SecretOfTheStarsViewTitle.rawValue,
                   onboardingDescription: ACYTextHelper.ACYOnboardingText.ACYonboardingDescriptionText.SecretOfTheStarsViewDescription.rawValue),
        Onboarding(id: 2,
                   onboardingImage: .yourFuture,
                   onboardingTitle: ACYTextHelper.ACYOnboardingText.ACYonboardingTitleText.YourFutureViewTitle.rawValue,
                   onboardingDescription: ACYTextHelper.ACYOnboardingText.ACYonboardingDescriptionText.YourFutureViewDescription.rawValue),
    ]
}
