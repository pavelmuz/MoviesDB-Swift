//
//  AuthButton.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct AuthButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.backgroundMain)
            .frame(width: 320, height: 40)
            .background(.labelsMain)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    AuthButton(title: "Sign In")
}
