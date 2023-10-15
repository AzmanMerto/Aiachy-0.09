//
//  HomeView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.05.2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter = HomePresenter()
    let router: HomeRouterPresenter
    
    var body: some View {
        ACYMinorButton(text: "LogOut") {
            presenter.logout()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(router: HomeRouterPresenter())
    }
}
