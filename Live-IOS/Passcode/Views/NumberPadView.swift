//
//  NumberPadView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct NumberPadView: View {
    
    @StateObject var vm = PasscodeViewModel()
    @Binding var passcode: String
    
    private let columns: [GridItem] = [
        .init(),
        .init(),
        .init()
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1...9, id: \.self) { index in
                Button {
                    vm.addValue(index)
                } label: {
                    Text("\(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .contentShape(.rect)
                }
                
            }
            Button {
                vm.removeValue()
            } label: {
                Image(systemName: "delete.backward")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            }
            Button {
                vm.addValue(0)
            } label: {
                Text("0")
                    .font(.title)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            }
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    NumberPadView(passcode: .constant("111"))
}
