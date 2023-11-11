//
//  AuthInputFieldModifier.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct AuthInputFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding(12)
            .frame(height: 35)
            .background(.inputBackground)
            .clipShape(RoundedRectangle(cornerRadius: 9))
    }
}
