//
//  CrystalSelectionPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

private protocol HandlerProtocol {
    func makeZodiacString(_ zodiac: TextHelper.SpiritualCompletion.dateZodiac ) -> String
}
// CrystalSelectionPresenter - Presenter
class CrystalSelectionPresenter: ObservableObject {
    
    @Published var isUserSelectedZodiac: Bool
    @Published var selectedCrystalName: TextHelper.SpiritualCompletion.crystalName?
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    let columns: [GridItem]
    
    init(isUserSelectedZodiac: Bool = false,
         aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter,
         columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)) {
        self.isUserSelectedZodiac = isUserSelectedZodiac
        self.aiachyState = aiachyState
        self.router = router
        self.columns = columns
    }
    
    let zodiacSelectEntity : [CrystalSelectEntity] = [
        CrystalSelectEntity(id: 0,
                            image: .ariesCrystal,
                            name: .ariesCrystal,
                            date: .ariesZodiacDate),
        CrystalSelectEntity(id: 1,
                            image: .taurusCrystal,
                            name: .taurusCrystal,
                            date: .taurusZodiacDate),
        CrystalSelectEntity(id: 2,
                            image: .geminiCrystal,
                            name: .geminiCrystal,
                            date: .geminiZodiacDate),
        CrystalSelectEntity(id: 3,
                            image: .cancerCrystal,
                            name: .cancerCrystal,
                            date: .cancerZodiacDate),
        CrystalSelectEntity(id: 4,
                            image: .leoCrystal,
                            name: .leoCrystal,
                            date: .leoZodiacDate),
        CrystalSelectEntity(id: 5,
                            image: .virgoCrystal,
                            name: .virgoCrystal,
                            date: .virgoZodiacDate),
        CrystalSelectEntity(id: 6,
                            image: .libraCrystal,
                            name: .libraCrystal,
                            date: .libraZodiacDate),
        CrystalSelectEntity(id: 7,
                            image: .scorpioCrystal,
                            name: .scorpioCrystal,
                            date: .scorpioZodiacDate),
        CrystalSelectEntity(id: 8,
                            image: .sagittariusCrystal,
                            name: .sagittariusCrystal,
                            date: .sagittariusZodiacDate),
        CrystalSelectEntity(id: 9,
                            image: .capricornCrystal,
                            name: .capricornCrystal,
                            date: .capricornZodiacDate),
        CrystalSelectEntity(id: 10,
                            image: .aquariusCrystal,
                            name: .aquariusCrystal,
                            date: .aquariusZodiacDate),
        CrystalSelectEntity(id: 11,
                            image: .piscesCrystal,
                            name: .piscesCrystal,
                            date: .piscesZodiacDate)
    ]
}

extension CrystalSelectionPresenter {
    
    func selectedZodiacToInt(selectedZodiac: TextHelper.SpiritualCompletion.crystalName) -> Int {
        switch selectedZodiac {
        case .ariesCrystal:
            return 0
        case .taurusCrystal:
            return 1
        case .geminiCrystal:
            return 2
        case .cancerCrystal:
            return 3
        case .leoCrystal:
            return 4
        case .virgoCrystal:
            return 5
        case .libraCrystal:
            return 6
        case .scorpioCrystal:
            return 7
        case .sagittariusCrystal:
            return 8
        case .capricornCrystal:
            return 9
        case .aquariusCrystal:
            return 10
        case .piscesCrystal:
            return 11
        }
    }
}
