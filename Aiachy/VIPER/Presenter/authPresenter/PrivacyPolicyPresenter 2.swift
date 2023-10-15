//
//  PrivacyPolicyPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 20.05.2023.
//

import Foundation

class PrivacyPolicyPresenter: ObservableObject {
    @Published var selectedPolicy: PolicysViews? = nil
    
    enum PolicysViews: String, Identifiable {
        case PrivacyPolicy, TermsConditions
        
        var id: String {
            self.rawValue
        }
    }
    
}
