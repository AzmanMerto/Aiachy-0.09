//
//  ACYAuthOnboardingEntity.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import SwiftUI

struct ACYAuthOnboardingEntity: Identifiable {
    var id: Int
    var image: ImageHelper.AuthCompletion.onboarding
    var title: TextHelper.AuthCompletion.onboarding
    var description: TextHelper.AuthCompletion.onboarding
}
