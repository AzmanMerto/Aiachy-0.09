//
//  AscendantSelectionInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation

//MARK: AscendantSelectionInteractor - procotol  - AscendantSelectionInteractorAscendantHandlerProtocol
private protocol AscendantSelectionInteractorAscendantHandlerProtocol {
    func completionHandlerAscendant(aiachyState: AiachyState)
    func makeUserAscendant(userZodiac: UserZodiac, userHour: Int) -> Int
    func matchZodiac(userZodiac: Int, phaseLevel: Int) -> Int
}

class AscendantSelectionInteractor: ObservableObject {
    
    init() {
        
    }
    /// Allows all processes to be started
    /// - Parameter aiachyState: users informations.
    /// - Returns: if turn true setted ascendant or turn false its have problem.
    func setAscendant(aiachyState: AiachyState) -> Bool {
        completionHandlerAscendant(aiachyState: aiachyState)
        let settedAscendant = aiachyState.user.userZodiac.ascendant
        guard settedAscendant != nil else { return false}
        return true
    }
}
//MARK: AscendantSelectionPresenter - extension - AscendantSelectionInteractorAscendantHandlerProtocol
extension AscendantSelectionInteractor: AscendantSelectionInteractorAscendantHandlerProtocol {
    /// We are saving your ascendant sign user AiachyState.
    /// - Parameter aiachyState: We need user information on AiachyState.
    fileprivate func completionHandlerAscendant(aiachyState: AiachyState) {
        
        let userBirthDayClock = aiachyState.user.userInfo.birthDay.clock
        let controlledUserHour = controlUserClock(birthDay: userBirthDayClock)
        
        let userZodiac = aiachyState.user.userZodiac
        let newAscendant = makeUserAscendant(userZodiac: userZodiac, userHour: controlledUserHour)
        aiachyState.user.userZodiac.ascendant = newAscendant
    }
    /// Creating an ascendant sign.
    /// - Parameters:
    ///   - userZodiac: User's zodiac sign
    ///   - userHour: User selected time
    /// - Returns: We subtract the rising sign as a numerical value.
    fileprivate func makeUserAscendant(userZodiac: UserZodiac, userHour: Int) -> Int {
        guard let checkedUserZodiac = userZodiac.zodiac else { return .zero}
        return matchZodiac(userZodiac: checkedUserZodiac, phaseLevel: userHour)
    }
    /// We extract data for the rising sign using the user selected time
    /// - Parameter birthDay: We're taking hours here.
    /// - Returns: We are trying to find the rising sign by presenting it as phaseLevel.
    fileprivate func controlUserClock(birthDay: UserInfoBirthDayClock) -> Int {
        guard let checkedUserHour = birthDay.hour, let checkedUserMinute = birthDay.minute else { return .zero }
        
        let userHourInFloat = Float(checkedUserHour) + Float(checkedUserMinute) / 60.0
        switch userHourInFloat {
            case 4..<6:
                return 0
            case 6..<8:
                return 1
            case 8..<10:
                return 2
            case 10..<12:
                return 3
            case 12..<14:
                return 4
            case 14..<16:
                return 5
            case 16..<18:
                return 6
            case 18..<20:
                return 7
            case 20..<22:
                return 8
            case 22..<24:
                return 9
            case 0..<2:
                return 10
            case 2..<4:
                return 11
            default:
                return .zero
        }
    }
    /// To understand which rising sign the user is.
    /// - Parameters:
    ///   - userZodiac: user sign.
    ///   - phaseLevel: to find out what time range the user is in.
    /// - Returns: ascendant as rotation rotates.
    fileprivate func matchZodiac(userZodiac: Int, phaseLevel: Int) -> Int {
        let matchedZodiac = userZodiac + phaseLevel
        guard matchedZodiac > 12 else { return matchedZodiac}
        return matchedZodiac - 12
    }
}
