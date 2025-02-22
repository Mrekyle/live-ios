//
//  NewPasscodeView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct NewPasscodeView: View {
    @StateObject var vm = PasscodeViewModel()
    
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
                NumberPadView(passcode: $vm.passcode)
            } else {
                NumberPadView(passcode: $vm.passcodeConfirmation)
            }
        }
    }
}

#Preview {
    NewPasscodeView()
}
