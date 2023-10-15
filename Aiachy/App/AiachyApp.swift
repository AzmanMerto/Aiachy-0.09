//
//  AiachyApp.swift
//  Aiachy
//
//  Created by NomoteteS on 9.01.2023.
//

import SwiftUI

@main
struct AiachyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
