//
//  PasscodeView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct PasscodeView: View {
    
    @StateObject var vm = PasscodeViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 48) {
                VStack(spacing: 10) {
                    Text("Enter Passcode")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
                .padding(.top)
                Spacer()
                
                if vm.showPasscodeError {
                    VStack {
                        Text("Invalid Passcode. Please try again")
                            .font(.title2)
                            .foregroundStyle(.red)
                        //                    Add shake animation?
                    }
                }
                
                CodeIndicatorView(passcode: $vm.passcode)
                
                Spacer()
                
                NumberPadView(passcode: $vm.passcode)
                
            }
        }
        .onChange(of: vm.passcode, { oldValue, newValue in
            vm.verifyCodeForAuthentication()
        })
    }
}

#Preview {
    PasscodeView()
}
