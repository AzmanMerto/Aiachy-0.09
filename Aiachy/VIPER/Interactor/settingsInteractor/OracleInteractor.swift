//
//  OracleInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import Foundation

private protocol StoreProtocol {
}

class OracleInteractor: ObservableObject {
    
    private let storeKitManager: StoreKitManager
    
    init(storeKitManager: StoreKitManager = StoreKitManager()) {
        self.storeKitManager = storeKitManager
    }
    
}


extension OracleInteractor: StoreProtocol {
    

}
