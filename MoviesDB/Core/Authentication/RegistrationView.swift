//
//  Registration View.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email     = ""
    @State private var fullname  = ""
    @State private var username  = ""
    @State private var password1 = ""
    @State private var password2 = ""
    let device = UIDevice.current.userInterfaceIdiom
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            // Logo + title
            AuthHeader()
            
            // Input fields
            VStack(spacing: 12) {
                AuthInputField(
                    imageName: "envelope",
                    placeholder: "email-field",
                    text: $email
                )
                .textInputAutocapitalization(.never)
                
                AuthInputField(
                    imageName: "person.crop.square",
                    placeholder: "fullname-field",
                    text: $fullname
                )
                
                AuthInputField(
                    imageName: "tv.inset.filled",
                    placeholder: "username-field",
                    text: $username
                )
                .textInputAutocapitalization(.never)
                
                AuthSecureField(
                    imageName: "lock.square",
                    placeholder: "passford-field",
                    text: $password1
                )
                
                AuthSecureField(
                    imageName: "lock.square",
                    placeholder: "confirm-password",
                    text: $password2
                )
            }
            .padding(.bottom, 15)
            .padding(.horizontal, device == .phone ? 6 : 50)
                        
            // SignUp button
            VStack {
                Button {
                    print("Handle sign up")
                } label: {
                    AuthButton(title: "sign-up-button")
                }
                
                AuthServicesButtonsView()
            }
            
            
            
            Spacer()
            
            Divider()
            
            // Button to LoginView
            Button {
                dismiss()
            } label: {
                AuthFooter(title1: "already-have-an-account", title2: "sign-in")
            }
            .padding(.vertical, 10)
        }
        .background(.backgroundMain)
        
        
    }
}

#Preview {
    RegistrationView()
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    RegistrationView()
        .environment(\.locale, .init(identifier: "en"))
}
