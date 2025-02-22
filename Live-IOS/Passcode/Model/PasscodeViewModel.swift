//
//  PasscodeViewModel.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import Foundation
import SwiftUI

@MainActor
final class PasscodeViewModel: ObservableObject {
    @AppStorage("hasPreviouslyAuthenticated") private var hasPreviouslyAuthenticated: Bool = false
    @AppStorage("isAuthenticated") private var isAuthenticated: Bool = false
    
    @Published var passcodeExists: Bool = false
    @Published var showPasscodeError: Bool = false
    @Published var showPasscodeConfirmation: Bool = false
    @Published var passcodeConfirmed: Bool = false
    
    @Published var passcode: String = ""
    @Published var passcodeConfirmation: String = ""
    @Published var revealedCode: String = ""
    
//    ///Checks if a passcode has alreay been created by the user and stored in the keychain
//    func checkIfPasscodeExists() async -> Bool {
//        do {
//            let passcode = try await idController.getPasscode()
//            return !passcode.isEmpty
//        } catch {
//            return false
//        }
//    }
    
    ///Handles added numbers to the passcode
    func addValue(_ value: Int) {
        if passcode.count < 4 {
            passcode += "\(value)"
        }
    }

    ///Handles removing numbers from the passcode
    func removeValue() {
        if !passcode.isEmpty {
            passcode.removeLast()
        }
    }
    
    ///Checks the length of the passcode
    func verifyPasscodeLength(passcode: String) -> Bool {
        if passcode.count < 4 {
            return false
        }
        return true
    }
    
    ///Checks the confirmation passcode length
    func verifyPasscodeConfirmationLength(passcodeConfirmation: String) -> Bool {
        if passcodeConfirmation.count < 4 {
            return false
        }
        return true
    }
    
    ///Handles passcode entry
    func handlePasscodeEntry() {
        if !showPasscodeConfirmation {
            showPasscodeConfirmation = self.verifyPasscodeLength(passcode: passcode)
        }
    }
    
    ///Verify the stored passcode matches the user entered passcode to authenticate them into the app
    func verifyCode() async {
        guard passcode.count == 4 else { return }
        
        let userPasscode = "1111"
        
        try? await Task.sleep(nanoseconds: 125_000_000)
        
        if passcode == userPasscode {
            await MainActor.run {
                isAuthenticated = true
                passcode = ""
            }
        } else {
            await MainActor.run {
                showPasscodeError = true
                passcode = ""
            }
        }
    }
    
    ///Handles checking the initial passcode entered with the confirmation passcode. Sending a notification if they match, can authenticate the user and save the passcode to Keychain
    func handleConfirmationPasscode() {
        guard passcodeConfirmation.count == 4 else { return }
        
        Task {
            if passcode == passcodeConfirmation {
                do {
//                    try idController.storePasscode(passcode)
//                    let notification = Notification(identifier: UUID().uuidString, title: "Pincode Confirmed", body: "Your pincode has been set, and can now be used to securely access your account", timeInterval: 1, repeats: false)
//                    await nManager.schedule(notification: notification)
                    await MainActor.run {
                        isAuthenticated = true
                        passcodeConfirmed = true
                        passcode = ""
                        passcodeConfirmation = ""
                    }
                }
            } else {
                await MainActor.run {
                    passcode = ""
                    passcodeConfirmation = ""
                    showPasscodeError = true
                }
            }
        }
    }
    
    ///Verify the code of the input for user authentication
    func verifyCodeForAuthentication() {
       guard passcode.count == 4 else { return }
       
       Task {
           let userPasscode = "111"
           
           try? await Task.sleep(nanoseconds: 125_000_000)
           let isCorrect = passcode == userPasscode
           
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
               if isCorrect {
                   self.isAuthenticated = true
                   self.hasPreviouslyAuthenticated = true
                   self.passcode = ""
               } else {
                   self.showPasscodeError = true
                   self.passcode = ""
               }
               self.passcode = ""
           }
       }
   }
    
    ///Handles deleting the stored user passcode, allowing the user to reset the passcode
//    func resetUserPasscode() async throws {
//        do {
//            let codeDestroyed = try await oController.deleteKeyChainItem(service: "onarken", account: "user_passcode")
//            if codeDestroyed {
//                await checkPasscodeExists()
//                await MainActor.run {
//                    passcodeExists = false
//                }
//            } else {
//                throw OnarkenError.failedToDeletePasscode
//            }
//        } catch {
//            throw OnarkenError.failedToDeletePasscode
//        }
//    }
    
    ///Handles resetting the passcodes for the user to re enter new codes
    func resetCodes() {
        passcode = ""
        passcodeConfirmation = ""
        if showPasscodeConfirmation {
            showPasscodeConfirmation = false
            showPasscodeError = false
        }
    }
}
