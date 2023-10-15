//
//  OnboardingPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import Foundation


class OnboardingPresenter: ObservableObject {
    
    @Published var currentIndex: Int
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    
    init(currentIndex: Int = 0, 
         aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter) {
        self.currentIndex = currentIndex
        self.aiachyState = aiachyState
        self.router = router
    }
    
    lazy var acyOnboardingEntityData: [ACYAuthOnboardingEntity] = [
        ACYAuthOnboardingEntity(id: 0,
                                image: .authHeart,
                                title: .heartofMysticTitle,
                                description: .heartofMysticDescription),
        ACYAuthOnboardingEntity(id: 1,
                                image: .secretStar,
                                title: .secretOfTheStarsTitle,
                                description: .secretOfTheStarsDescription),
        ACYAuthOnboardingEntity(id: 2,
                                image: .yourFuture,
                                title: .yourFutureTitle,
                                description: .yourFutureDescription),
    ]
}
