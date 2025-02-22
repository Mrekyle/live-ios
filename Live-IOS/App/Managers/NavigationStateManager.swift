//
//  NavigationStateManager.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import Foundation
import SwiftUI

final class NavigationStateManager: ObservableObject {
    enum Tab: Int {
       case dashboard = 0
       case holiday = 1
       case sick = 2
       case spare = 3
    }
   
    @Published var path = NavigationPath()
    @Published var selectedTab: Tab = .dashboard

    func resetPath() {
        path = NavigationPath()
    }
    
    func navigateToTab(_ tab: Tab) {
        selectedTab = tab
    }
}
