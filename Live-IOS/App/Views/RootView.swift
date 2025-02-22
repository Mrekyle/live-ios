//
//  RootView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct RootView: View {
    @AppStorage("isAuthenticated") private var isAuthenticated: Bool = false
    
    var body: some View {
        if !isAuthenticated {
            AuthenticateView()
        } else {
            ContentView()
        }
    }
}

#Preview {
    RootView()
}
