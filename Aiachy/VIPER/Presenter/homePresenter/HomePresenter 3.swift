//
//  HomePresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation
import FirebaseFirestore
import SwiftyTranslate

private protocol HandlerProtocol {
    func makerCompletion()
    func makeCompatibilityEntity()
    func makeComment()
    func makeChakraStatus()
    func makeTranslate(for input: String, completion: @escaping (String) -> ())
    func checkGuestControl() -> Bool
}

private protocol CoreDataProtocol {
    func getZodiacEntityWithDay()
    func filterWithCurrentZodiac(entity userAllEntity: [ACYUserAllEntity]?) -> ACYUserAllEntity?
}

class HomePresenter: ObservableObject {
    
    @Published var currentEntity: ACYUserAllEntity?
    @Published var currentTime: TextHelper.HomeCompletion.date
    @Published var isOracled: Bool
    @Published var statusCurrentIndex: Int
    
    //NextPatchTODO: Will deleted
    @Published var compatibilityEntity: [ACYCompatibilityEntity] = []
    @Published var comment: String = ""
    @Published var ascendiantComment: String = ""
    @Published var chakraStatusEntities: [ACYChakraStatusEntity] = []
    
    private let aiachyState: AiachyState
    private let router: HomeRouterPresenter
    let interactor: HomeInteractor
    
    init(currentTime: TextHelper.HomeCompletion.date = .today,
         isOracled: Bool = true,
         statusCurrentIndex: Int = 0,
         aiachyState: AiachyState,
         router: HomeRouterPresenter,
         interactor: HomeInteractor = HomeInteractor()) {
        self.currentTime = currentTime
        self.isOracled = isOracled
        self.statusCurrentIndex = statusCurrentIndex
        self.aiachyState = aiachyState
        self.router = router
        self.interactor = interactor
        
        getZodiacEntityWithDay()
        makeComment()
    }
    
}

extension HomePresenter: HandlerProtocol {
    
    /// <#Description#>
    fileprivate func makerCompletion() {
        makeCompatibilityEntity()
        makeComment()
        makeAscendiant()
        self.chakraStatusEntities = []
        makeChakraStatus()
    }
    
    /// <#Description#>
    fileprivate func makeCompatibilityEntity() {
        guard currentEntity?.compatibility.isEmpty == false else {
            self.compatibilityEntity = [ACYCompatibilityEntity(serialNumber: 0, zodiac: 0, compatibilityDataVersion: "0.0.0"),
                                        ACYCompatibilityEntity(serialNumber: 0, zodiac: 0, compatibilityDataVersion: "0.0.0")]
            return
        }
        self.compatibilityEntity = currentEntity!.compatibility
    }
    
    /// <#Description#>
    fileprivate func makeComment() {
        guard let checkedComment = currentEntity?.zodiac.comment else {
            makeTranslate(for: "Şu anda mevcut veri yok bunun için üzgünüm") { self.comment = $0 }
            return }
        makeTranslate(for: checkedComment) { self.comment = $0 }
    }
    
    /// <#Description#>
    fileprivate func makeAscendiant() {
        let ascendiant = aiachyState.user.userZodiac.ascendant
        let ascendiantEntity = currentEntity?.ascendiant
        
        guard ascendiantEntity?.isEmpty == false else {
            makeTranslate(for: "Şu anda mevcut veri yok bunun için üzgünüm") { self.ascendiantComment = $0 }
            return}
        let ascendiantString = ascendiantEntity.map { $0.filter { $0.determinedZodiac == ascendiant } }?.first
        
        makeTranslate(for: ascendiantString!.comment) { self.ascendiantComment = $0 }
    }
    
    /// <#Description#>
    fileprivate func makeChakraStatus() {
        
        
        for number in 0...6 {
            if let existingEntity = currentEntity?.chakraStatus.first(where: { $0.tier == number }) {
                // Eğer mevcut bir entity varsa, onu kullanıyoruz
                makeTranslate(for: existingEntity.comment) {
                    let acyChakraStatusEntity = ACYChakraStatusEntity(
                        serialNumber: existingEntity.serialNumber,
                        tier: existingEntity.tier,
                        rate: existingEntity.rate,
                        comment: $0,
                        statusDataVersion: existingEntity.statusDataVersion)
                    self.chakraStatusEntities.append(acyChakraStatusEntity)
                }
            } else {
                // Eğer mevcut bir entity yoksa, mock data kullanıyoruz
                makeTranslate(for: "Şu anda mevcut veri yok bunun için üzgünüm") {
                    let acyChakraStatusEntity = ACYChakraStatusEntity(
                        serialNumber: 0,
                        tier: number,
                        rate: 0.2,
                        comment: $0,
                        statusDataVersion: "0.0.0")
                    self.chakraStatusEntities.append(acyChakraStatusEntity)
                }
            }
        }
        
    }

    
    /// <#Description#>
    /// - Parameters:
    ///   - input: <#input description#>
    ///   - completion: <#completion description#>
    fileprivate func makeTranslate(for input: String, completion: @escaping (String) -> ()) {
        let currentLanguageID = aiachyState.user.aiachyInfo.wrappedLanguageIdentifier
        
        SwiftyTranslate.translate(text: input, from: "tr", to: currentLanguageID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    completion(success.translated)
                case .failure(_): break
                }
            }
        }
    }
    
    func checkGuestControl() -> Bool  {
        aiachyState.isGuest
    }
    
    
    
}

extension HomePresenter: CoreDataProtocol {
    func getZodiacEntityWithDay() {
        if currentTime == .yesterday {
            interactor.filteredZodiacEntities(day: -1) { self.currentEntity = self.filterWithCurrentZodiac(entity: $0)}
            makerCompletion()
        } else if currentTime == .today {
            interactor.filteredZodiacEntities(day: 0) { self.currentEntity = self.filterWithCurrentZodiac(entity: $0)}
            makerCompletion()
        } else if currentTime == .tomorrow {
            interactor.filteredZodiacEntities(day: 1) { self.currentEntity = self.filterWithCurrentZodiac(entity: $0) }
            makerCompletion()
        }
    }
    
    fileprivate func filterWithCurrentZodiac(entity userAllEntity: [ACYUserAllEntity]?) -> ACYUserAllEntity? {
        
        let currentZodiac = aiachyState.user.userZodiac.zodiac
        
        
        let filteredEntity = userAllEntity?.first { entity in
            return entity.zodiac.zodiac == currentZodiac
        }
        return filteredEntity
    }
}
