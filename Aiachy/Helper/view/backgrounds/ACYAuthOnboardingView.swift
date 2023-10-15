//
//  ACYAuthOnboardingView.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI

struct ACYAuthOnboardingView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var selection: Int
    let acyAuthOnboardingEntityData: [ACYAuthOnboardingEntity]
    
    var body: some View {
        TabView(selection: $selection, content: {
            ForEach(acyAuthOnboardingEntityData, id: \.id) { onboarding in
                OnboardingTemplate(ACYOnboardingEntityData: onboarding)
            }
        })
        .tabViewStyle(.page(indexDisplayMode: .never))
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "ACYOnboardingID")
    }
}
#Preview("ACYOnboarding") {
    ACYAuthOnboardingView(selection: .constant(0),
                  acyAuthOnboardingEntityData: [ACYAuthOnboardingEntity(id: 0, image: .authHeart,
                                                                        title: .heartofMysticTitle,
                                                                        description: .heartofMysticDescription)])
        .environmentObject(ACY_PREVIEWS_STATE)
}
private struct OnboardingTemplate: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let ACYOnboardingEntityData: ACYAuthOnboardingEntity
    
    var body: some View {
        VStack(spacing: 0) {
            Image(ACYOnboardingEntityData.image.rawValue)
                .resizable()
                .scaledToFit()
                .frame(height: ACYdh(aiachyState, d: 0.38))
            ACYTitleAndDescriptionText(title: TextHandler.makeAuthOnboardingString(aiachy: aiachyState,
                                                                                   onboarding: ACYOnboardingEntityData.title),
                                       description: TextHandler.makeAuthOnboardingString(aiachy: aiachyState,
                                                                                         onboarding: ACYOnboardingEntityData.description))
        }
        .environmentObject(aiachyState)
    }
}

