//
//  Live_IOSApp.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

@main
struct Live_IOSApp: App {
    @StateObject private var navigationState = NavigationStateManager()
    
    init() {
        let defaults: [String : Any] = [
            "hasPreviouslyAuthenticated": false,
            "isAuthenticated" : false,
        ]
        UserDefaults.standard.register(defaults: defaults)
    }
        
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(NotificationManager())
                .environmentObject(NavigationStateManager())
        }
    }
}
