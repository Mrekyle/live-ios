//
//  NewPasscodeHeaderView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct NewPasscodeHeaderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Enter Passcode")
                .font(.largeTitle)
                .bold()
            Text("Set a passcode to maintain secure access into your account.")
                .multilineTextAlignment(.center)
        }
        .padding(.top, 20)
    }
}

#Preview {
    NewPasscodeHeaderView()
}
