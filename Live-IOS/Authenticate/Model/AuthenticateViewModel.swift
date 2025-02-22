//
//  AuthenticateViewModel.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import Foundation
import SwiftUI

class AuthenticateViewModel: ObservableObject {
    
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var wrongUsernameCount: Int = 0
    @Published var wrongPasswordCount: Int = 0
    
    @Published var showingAuthenticationView: Bool = false
    @Published var showRegistrationView: Bool = false
    @Published var showForgottenPassword: Bool = false
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "kyle" {
            wrongUsernameCount = 0
            if password.lowercased() == "password" {
                wrongPasswordCount = 0
                isAuthenticated = true
            } else {
                wrongPasswordCount = 2
            }
        } else {
            wrongUsernameCount = 2
        }
    }
}
