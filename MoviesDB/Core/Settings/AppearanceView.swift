//
//  AppearanceView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 20.10.2023.
//

import SwiftUI

struct AppearanceView: View {
    @Environment(\.dismiss) var dismiss
    @State private var darkMode = false
    @State private var selectedLanguage = "English"
    private let languages = ["English", "Русский"]
    
    var body: some View {
        ZStack {
            Color(.feedCellBackground)
                .ignoresSafeArea()
            
            Form {
                Toggle("Dark Mode", isOn: $darkMode)
                    .tint(.labelsMain)
                    .foregroundStyle(.labelsMain)
                
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) {
                        Text($0)
                    }
                }
                .foregroundStyle(.labelsMain)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.labelsMain)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Appearance")
                        .foregroundStyle(.labelsMain)
                }
            }
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
