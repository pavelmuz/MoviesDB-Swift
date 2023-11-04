//
//  AppearanceView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 20.10.2023.
//

import SwiftUI

struct AppearanceView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.feedCellBackground)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    NavigationStack {
        AppearanceView()
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        AppearanceView()
            .preferredColorScheme(.dark)
    }
}
