//
//  AuthenticateView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI
import SwiftData

struct AuthenticateView: View {
    
    @Environment(\.modelContext) private var modelContext
    @StateObject var authVM = AuthenticateViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundStyle(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundStyle(.white)
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Live-IOS")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                    TextField("Username",text: $authVM.username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(authVM.wrongUsernameCount))
                    SecureField("Password", text: $authVM.password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(authVM.wrongPasswordCount))
                    HStack(alignment: .center) {
                        Button("Forgot Password") {
                            authVM.showForgottenPassword = true
                        }
                    }
                    Button("Login") {
                        authVM.authenticateUser(username: authVM.username, password: authVM.password)
                    }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                    Button("Register") {
                        authVM.showRegistrationView = true
                    }
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
            .navigationDestination(isPresented: $authVM.isAuthenticated) {
                ContentView()
            }
            .navigationDestination(isPresented: $authVM.showRegistrationView) {
                RegistrationView()
            }
            .sheet(isPresented: $authVM.showForgottenPassword) {
                Text("Forgotton password view")
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    AuthenticateView()
}
