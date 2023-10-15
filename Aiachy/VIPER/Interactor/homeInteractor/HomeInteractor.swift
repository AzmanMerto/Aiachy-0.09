//
//  HomeInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

private protocol HandlerProtocol {
    func filterWithDay(day: Int) -> String
}

private protocol CoreDataProtocol {
    
}

class HomeInteractor: ObservableObject {
    
    @Published private var acyUserAllEntities: [ACYUserAllEntity]
    let coreDataManager: CoreDataManager
    
    init(acyUserAllEntities: [ACYUserAllEntity] = [],
         coreDataManager: CoreDataManager = CoreDataManager()) {
        self.acyUserAllEntities = acyUserAllEntities
        self.coreDataManager = coreDataManager
        
        getCoreData()
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - day: <#day description#>
    ///   - completion: <#completion description#>
    func filteredZodiacEntities(day: Int, completion: @escaping ([ACYUserAllEntity]?) -> ()) {
        
        let filteredEntities = acyUserAllEntities.filter {  $0.zodiac.date == (filterWithDay(day: day)) }
        completion(filteredEntities)
    }        
}

extension HomeInteractor: HandlerProtocol {
    /// We take the Present time and take the time I want.
    /// - Parameter day: It is to find out how many days before or after the desired day is.
    /// - Returns: The specified date returns as time.
    func filterWithDay(day: Int) -> String {
        /// values
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        let today = Date()
        /// setted date
        let settedDate = calendar.date(byAdding: .day, value: day, to: today)
        /// checking
        guard let newDate = settedDate else { return "0"}
        /// formating
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: newDate)
        /// return object
        return dateString
    }
}

extension HomeInteractor: CoreDataProtocol {
    func getCoreData() {
        self.acyUserAllEntities = coreDataManager.fetchAllUserEntities()!
    }
}

