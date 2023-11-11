//
//  AuthServicesButtonsView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 08.10.2023.
//

import SwiftUI

struct AuthServicesButtonsView: View {
    var body: some View {
        HStack(spacing: 10) {
            Button {
                print("Sign up with Google")
            } label: {
                Image(.google)
                    .resizable()
                    .modifier(AuthServicesButtonModifier())
            }
            
            Button {
                print("Sign up with Apple")
            } label: {
                Image(.appleLogo)
                    .resizable()
                    .modifier(AuthServicesButtonModifier())
            }
            
            Button {
                print("Sign up with Mail.ru")
            } label: {
                Image(.mailru)
                    .resizable()
                    .modifier(AuthServicesButtonModifier())
            }
            
            Button {
                print("Sign up with Yandex")
            } label: {
                Image(.yandex)
                    .resizable()
                    .modifier(AuthServicesButtonModifier())
            }
        }
    }
}

#Preview {
    AuthServicesButtonsView()
        .preferredColorScheme(.dark)
}

#Preview {
    AuthServicesButtonsView()
        .preferredColorScheme(.light)
}
