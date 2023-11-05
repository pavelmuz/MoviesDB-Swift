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
            Color(.cellBackground)
                .ignoresSafeArea()
            
            Form {
                Toggle("dark-mode", isOn: $darkMode)
                    .tint(.labelsMain)
                    .foregroundStyle(.labelsMain)
                
                Picker("language-selection", selection: $selectedLanguage) {
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
                    Text("appearance-title")
                        .font(.headline)
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
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview {
    NavigationStack {
        AppearanceView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
