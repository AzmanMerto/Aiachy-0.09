//
//  ACYOnboarding.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

struct ACYOnboarding: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var selection: Int
    let OnboardingItems: [Onboarding]
    
    var body: some View {
        TabView(selection: $selection, content: {
            ForEach(OnboardingItems, id: \.id) { onboarding in
                OnboardingTemplate(onboarding: onboarding)
            }
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ACYOnboardingID")
    }
}

struct ACYOnboarding_Previews: PreviewProvider {
    
    
    static let onboardingItems: [Onboarding] = [
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
                   onboardingTitle: ACYTextHelper.ACYOnboardingText.ACYonboardingTitleText.HeartofAstrologyViewTitle.rawValue,
                   onboardingDescription: ACYTextHelper.ACYOnboardingText.ACYonboardingDescriptionText.HeartofAstrologyViewDescription.rawValue),
    ]
    
    static var previews: some View {
        ACYOnboarding(selection: .constant(0), OnboardingItems: onboardingItems)
            .environmentObject(ACY_PREVIEWS_STATE)
    }
}

private struct OnboardingTemplate: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let onboarding: Onboarding
    
    var body: some View {
        VStack(spacing: 0) {
            Image.setACYOnboardingImage(aiachyState, onboarding: onboarding.onboardingImage)
                .resizable()
                .scaledToFit()
                .frame(height: ACYdh(aiachyState, d: ACY_UPMED_SIZE))
            ACYTitleAndDescriptionText(titleText: onboarding.onboardingTitle,
                                       descriptionText: onboarding.onboardingDescription)
        }
        .environmentObject(aiachyState)
    }
}

