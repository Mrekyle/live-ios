//
//  NewPasscodeView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct NewPasscodeView: View {
    @StateObject var vm = PasscodeViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            NewPasscodeHeaderView()
            Spacer()
            
            if vm.showPasscodeError {
                Text("These passcodes do not match. Please check and try again!")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .foregroundStyle(.red)
            }
            
            Spacer()
            
            VStack(spacing: 30) {
                VStack(spacing: 30) {
                    CodeIndicatorView(passcode: $vm.passcode)
                    
                    if vm.showPasscodeConfirmation {
                        CodeConfirmationIndicatorView(passcode: $vm.passcodeConfirmation)
                        
                        Button("Reset") {
                            vm.resetCodes()
                        }
                    }
                }
            }
            
            Spacer()
            
            if !vm.showPasscodeConfirmation {
                NumberPadView(vm: vm, passcode: $vm.passcode)
            } else {
                NumberPadView(vm: vm, passcode: $vm.passcodeConfirmation)
            }
        }
        .onAppear {
           vm.dismissAction = dismiss
       }
        .onChange(of: vm.passcode) { _, _ in
            vm.handlePasscodeEntry()
        }
        .onChange(of: vm.passcodeConfirmation) { _, _ in
            if !vm.verifyPasscodeConfirmationLength(passcodeConfirmation: vm.passcodeConfirmation) {
                vm.showPasscodeError = false
            } else {
                Task {
                    vm.handleConfirmationPasscode()
                }
            }
        }
    }
}

#Preview {
    NewPasscodeView()
}
