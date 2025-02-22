//
//  ContentView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasPreviouslyAuthenticated") private var hasPreviouslyAuthenticated: Bool = false
    @State private var showPinCodeSheet: Bool = true
    @EnvironmentObject private var navigationState: NavigationStateManager
    
    var body: some View {
        ZStack {
            TabView {
                DashboardView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Dashboard")
                    }
                HolidayView()
                    .tabItem {
                        Image(systemName: "airplane")
                        Text("Holiday Request")
                    }
                SicknessView()
                    .tabItem {
                        Image(systemName: "note.text.badge.plus")
                        Text("Sick Notes")
                    }
                SpareView()
                    .tabItem {
                        Image(systemName: "checkmark.seal")
                            Text("Spare View")
                    }
            }
            .tint(Color.blue)
            .transition(.opacity)
            .onAppear() {
                if !hasPreviouslyAuthenticated {
                    showPinCodeSheet = true
                }
            }
            .sheet(isPresented: $showPinCodeSheet) {
                NewPasscodeView()
                    .interactiveDismissDisabled()
            }
        }
    }
}

#Preview {
    ContentView()
}
