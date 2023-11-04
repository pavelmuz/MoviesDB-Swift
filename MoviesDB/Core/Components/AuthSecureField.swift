//
//  AuthSecureField.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct AuthSecureField: View {
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

            SecureField(placeholder, text: $text)
                .modifier(TextFieldModifier())
        }
        .foregroundStyle(.labelsMain)
        .padding(.horizontal, 7)
    }
}

#Preview {
    AuthSecureField(imageName: "lock", placeholder: "Password", text: .constant(""))
}
