//
//  CodeIndicatorView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct CodeIndicatorView: View {
    
    @Binding var passcode: String
    
    var body: some View {
        HStack(spacing: 32) {
            ForEach(0..<4) { index in
                Circle()
                    .fill(passcode.count > index ? .primary : Color.white)
                    .frame(width: 20, height: 20)
                    .overlay {
                        Circle()
                            .stroke(.black, lineWidth: 1.0)
                    }
            }
        }
    }
}

#Preview {
    CodeIndicatorView(passcode: .constant("111"))
}
