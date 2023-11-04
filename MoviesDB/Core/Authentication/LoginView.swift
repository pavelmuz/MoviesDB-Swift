//
//  LoginView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email     = ""
    @State private var password  = ""
    let device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        NavigationStack {
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
                    
                    AuthSecureField(
                        imageName: "lock.square",
                        placeholder: "passford-field",
                        text: $password
                    )
                    
                    NavigationLink {
                        ForgotPasswordView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("forgot-password")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.labelsMain)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing)
                    }
                    .padding(.bottom, 15)
                }
                .padding(.bottom, 4)
                .padding(.horizontal, device == .phone ? 6 : 50)
                
                // SignIn Button
                VStack {
                    Button {
                        print("Handle sign in")
                    } label: {
                        AuthButton(title: "sign-in-button")
                    }
                    
                    GoogleAppleBtnsView()
                }
                
                Spacer()
                
                Divider()
                
                // Link to Registratioin
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    AuthFooter(title1: "dont-have-an-account", title2: "sign-up")
                }
                .padding(.vertical, 10)
            }
            .background(.backgroundMain)
        }
        .tint(.labelsMain)
        
    }
}

#Preview {
    LoginView()
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    LoginView()
        .environment(\.locale, .init(identifier: "en"))
}
