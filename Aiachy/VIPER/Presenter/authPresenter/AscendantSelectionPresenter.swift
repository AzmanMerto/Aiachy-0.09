//
//  AscendantSelectionPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI
import Combine
import MapKit

//MARK: AscendantSelectionPresenter - procotol  - AscendantSelectionPresenterHandlerProtocol
private protocol HandlerProtocol {
    func checkValues(aiachyState: AiachyState, completion: () -> ())
    func uploadValuesToState(aiachyState: AiachyState)
    func updateValuesFromState(aiachyState: AiachyState)
    func searchArea(_ query: String)
}
private protocol AlertProtocol {
    func makeAgeAlert()
    func makeUnknownPlaceAlert()
    func closeAlert()
}
//MARK: AscendantSelectionPresenter - Presenter
class AscendantSelectionPresenter: ObservableObject {
    
    @Published var places = [Place]()
    @Published var acyAlertEntity: ACYAlertEntity

    @Published var userDate: Date
    @Published var isPressedLocationButton: Bool
    @Published var isShowingACYAlert: Bool
    @Published var userHour: Int = 0
    @Published var userMinute: Int = 00
    @Published var userLongitude: Double
    @Published var userLatitude: Double
    @Published var userCountry: String
    @Published var userProvince: String
    @Published var userDistrict: String
    @Published var searchText: String
    let aiachyState: AiachyState
    let router: AuthRouterPresenter
    let interactor: AscendantSelectionInteractor
    let searchPublisher = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init(acyAlertEntity: ACYAlertEntity = ACYAlertEntity(),
        userDate: Date = .now,
         isPressedLocationButton: Bool = false,
         isShowingACYAlert: Bool = false,
         userHour: Int = 0,
         userMinute: Int = 00,
         userLongitude: Double = 0,
         userLatitude: Double = 0,
         searchText: String = "",
         userCountry: String = "",
         userProvince: String = "",
         userDistrict: String = "",
         aiachy aiachyState: AiachyState,
         router: AuthRouterPresenter,
         interactor: AscendantSelectionInteractor = AscendantSelectionInteractor()) {
        self.acyAlertEntity = acyAlertEntity
        self.userDate = userDate
        self.isPressedLocationButton = isPressedLocationButton
        self.isShowingACYAlert = isShowingACYAlert
        self.userHour = userHour
        self.userMinute = userMinute
        self.userLongitude = userLongitude
        self.userLatitude = userLatitude
        self.searchText = searchText
        self.userCountry = userCountry
        self.userProvince = userProvince
        self.userDistrict = userDistrict
        self.aiachyState = aiachyState
        self.router = router
        self.interactor = interactor
        searchPublisher
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] in self?.searchArea($0) }
            .store(in: &cancellables)
    }
    
    /// we are making static button text
    /// - Returns: if guards clear return common text else return location
    func makeButtonText() -> String {
        
        let commonText = TextHandler.makeGeneralButtonString(aiachy: aiachyState, button: .chooseLocation)
        
        guard self.userCountry != "" else {
            return commonText
        }
        guard self.userProvince != "" else {
            return commonText
        }
        guard self.userDistrict != "" else {
            return commonText
        }
        return  "\(userDistrict),\(userProvince),\(userCountry)"
    }
}
//MARK: AscendantSelectionPresenter - HandlerProtocol
extension AscendantSelectionPresenter: HandlerProtocol {
    
    func makeChosenLocation() -> String {
        if !userCountry.isEmpty {
            return "\(userCountry)" + "/" + "\(userProvince)" + "/" + "\(userDistrict)"
        } else {
            return ""
        }
    }
    
    /// We are checking values is it true or false if false error type triggering else nothing else.
    /// - Parameter completion: When all cheking values complate that.
    func checkValues(aiachyState: AiachyState, completion: () -> ()) {
        
        let currentDate = Calendar.current
        let ageComponents = currentDate.dateComponents([.year], from: userDate, to: Date())
        let age = ageComponents.year!
        
        guard age > 13 else {
            makeAgeAlert()
            return
        }
        guard self.userCountry != "" else {
            makeUnknownPlaceAlert()
            
            return
        }
        uploadValuesToState(aiachyState: aiachyState)
        guard interactor.setAscendant(aiachyState: aiachyState) else {
            return
        }
        completion()
    }
    /// This value update to AiachyState.
    /// - Parameter aiachyState: thats where we will upload new data
    func uploadValuesToState(aiachyState: AiachyState) {
        
        let formater = DateFormatter()
        
        aiachyState.user.userInfo.location.country = userCountry
        aiachyState.user.userInfo.location.province = userProvince
        aiachyState.user.userInfo.location.district = userDistrict
        
        aiachyState.user.userInfo.birthDay.clock.hour = userHour
        aiachyState.user.userInfo.birthDay.clock.minute = userMinute
        
        formater.dateFormat = "dd"
        aiachyState.user.userInfo.birthDay.day = Int(formater.string(from: userDate))
        formater.dateFormat = "MM"
        aiachyState.user.userInfo.birthDay.month = Int(formater.string(from: userDate))
        formater.dateFormat = "yyyy"
        aiachyState.user.userInfo.birthDay.year = Int(formater.string(from: userDate))
    }
    /// Will update value from AiachState.
    /// - Parameter aiachyState: saved values if saved
    func updateValuesFromState(aiachyState: AiachyState) {
        self.userCountry = aiachyState.user.userInfo.location.country ?? ""
        self.userProvince = aiachyState.user.userInfo.location.province ?? ""
        self.userDistrict = aiachyState.user.userInfo.location.district ?? ""
    }
    /// searchArea is for the user to select the place of birth
    /// - Parameter query: To evaluate the incoming String value about the location
    fileprivate func searchArea(_ query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, _ in
            guard let response = response else { return }
            
            self?.places = response.mapItems.map {
                Place(
                    town: $0.placemark.locality ?? "",
                    country: $0.placemark.country ?? "",
                    city: $0.placemark.administrativeArea ?? "")
            }
        }
    }
}

extension AscendantSelectionPresenter: AlertProtocol {
    func makeAgeAlert() {
        acyAlertEntity.isShowingAlert = true
        acyAlertEntity.title = .notUserIsOlder
        acyAlertEntity.typeError = 0
        acyAlertEntity.firstButtonText = .tryAgain
        acyAlertEntity.firstAction = {
            self.closeAlert()
        }
    }
    
    func makeUnknownPlaceAlert() {
        acyAlertEntity.isShowingAlert = true
        acyAlertEntity.title = .notUserHavePlace
        acyAlertEntity.typeError = 0
        acyAlertEntity.firstButtonText = .tryAgain
        acyAlertEntity.firstAction = {
            self.closeAlert()
        }
    }
    
    func closeAlert() {
        acyAlertEntity = ACYAlertEntity()
    }
    
    
}
