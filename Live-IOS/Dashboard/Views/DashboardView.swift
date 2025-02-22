//
//  DashboardView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct DashboardView: View {
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    var body: some View {
        Button("Logout") {
            isAuthenticated = false
        }
    }
}

#Preview {
    DashboardView()
}
