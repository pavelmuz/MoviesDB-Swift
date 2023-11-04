//
//  AuthInputField.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct AuthInputField: View {
    let imageName: String
    let placeholder: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: imageName)
                .resizable()
                .font(.headline)
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            TextField(placeholder, text: $text)
                .modifier(TextFieldModifier())
        }
        .foregroundStyle(.labelsMain)
        .padding(.horizontal, 7)
    }
}

#Preview {
    AuthInputField(imageName: "envelope", placeholder: "Email", text: .constant(""))
}
