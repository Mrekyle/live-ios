//
//  IsLoadingView.swift
//  Live-IOS
//
//  Created by Kyle Chart on 22/02/2025.
//

import SwiftUI

struct IsLoading: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
                .ignoresSafeArea()
            ProgressView()
                .tint(Color.blue)
                .scaleEffect(4)
        }
    }
}

#Preview {
    IsLoading()
}
