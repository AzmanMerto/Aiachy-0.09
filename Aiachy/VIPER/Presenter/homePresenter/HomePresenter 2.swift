//
//  HomePresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import Foundation

class HomePresenter: ObservableObject {
    
    
    init() {
        
    }
    func logout() {
        ACYUserDefaults.set(nil, forKey: ACYUserID)
    }
    
}
