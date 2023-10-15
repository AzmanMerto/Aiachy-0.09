//
//  ZodiacSelectionPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

class ZodiacSelectionPresenter: ObservableObject {
    
    @Published var isUserSelectedZodiac: Bool
    @Published var selectedZodiac: String
    let columns: [GridItem]
    
    init(isUserSelectedZodiac: Bool = false,
         selectedZodiac: String = "",
         columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)) {
        self.isUserSelectedZodiac = isUserSelectedZodiac
        self.selectedZodiac = selectedZodiac
        self.columns = columns
    }
    
    let zodiacSelectEntity : [ZodiacSelect] = [
       ZodiacSelect(id: 0,
                    zodiacImage: .altAries,
                    selectedZodiacImage: .aries,
                    zodiacName: .AriesZodiac,
                    zodiacShortedDate: .AriesZodiacShortedDate),
       ZodiacSelect(id: 1,
                    zodiacImage: .altTaurus,
                    selectedZodiacImage: .taurus,
                    zodiacName: .TaurusZodiac,
                    zodiacShortedDate: .TaurusZodiacShortedDate),
       ZodiacSelect(id: 2,
                    zodiacImage: .altGemini,
                    selectedZodiacImage: .gemini,
                    zodiacName: .GeminiZodiac,
                    zodiacShortedDate: .GeminiZodiacShortedDate),
       ZodiacSelect(id: 3,
                    zodiacImage: .altCancer,
                    selectedZodiacImage: .cancer,
                    zodiacName: .CancerZodiac,
                    zodiacShortedDate: .CancerZodiacShortedDate),
       ZodiacSelect(id: 4,
                    zodiacImage: .altLeo,
                    selectedZodiacImage: .leo,
                    zodiacName: .LeoZodiac,
                    zodiacShortedDate: .LeoZodiacShortedDate),
       ZodiacSelect(id: 5,
                    zodiacImage: .altVirgo,
                    selectedZodiacImage: .virgo,
                    zodiacName: .VirgoZodiac,
                    zodiacShortedDate: .VirgoZodiacShortedDate),
       ZodiacSelect(id: 6,
                    zodiacImage: .altLibra,
                    selectedZodiacImage: .libra,
                    zodiacName: .LibraZodiac,
                    zodiacShortedDate: .LibraZodiacShortedDate),
       ZodiacSelect(id: 7,
                    zodiacImage: .altScorpion,
                    selectedZodiacImage: .scorpion,
                    zodiacName: .ScorpioZodiac,
                    zodiacShortedDate: .ScorpioZodiacShortedDate),
       ZodiacSelect(id: 8,
                    zodiacImage: .altSagittarius,
                    selectedZodiacImage: .sagittarius,
                    zodiacName: .SagittariusZodiac,
                    zodiacShortedDate: .SagittariusZodiacShortedDate),
       ZodiacSelect(id: 9,
                    zodiacImage: .altCapricorn,
                    selectedZodiacImage: .capricorn,
                    zodiacName: .CapricornZodiac,
                    zodiacShortedDate: .CapricornZodiacShortedDate),
       ZodiacSelect(id: 10,
                    zodiacImage: .altAquarius,
                    selectedZodiacImage: .aquarius,
                    zodiacName: .AquariusZodiac,
                    zodiacShortedDate: .AquariusZodiacShortedDate),
       ZodiacSelect(id: 11,
                    zodiacImage: .altPisces,
                    selectedZodiacImage: .pisces,
                    zodiacName: .PiscesZodiac,
                    zodiacShortedDate: .PiscesZodiacShortedDate)
       
    ]
    
}

extension ZodiacSelectionPresenter {
    func selectedZodiacToInt(selectedZodiac: String) -> Int {
        switch selectedZodiac {
        case "AriesZodiac":
            return 0
        case "TaurusZodiac":
            return 1
        case "GeminiZodiac":
            return 2
        case "CancerZodiac":
            return 3
        case "LeoZodiac":
            return 4
        case "VirgoZodiac":
            return 5
        case "LibraZodiac":
            return 6
        case "ScorpioZodiac":
            return 7
        case "SagittariusZodiac":
            return 8
        case "CapricornZodiac":
            return 9
        case "AquariusZodiac":
            return 10
        case "PiscesZodiac":
            return 11
        default:
            return .zero
        }
    }
}
