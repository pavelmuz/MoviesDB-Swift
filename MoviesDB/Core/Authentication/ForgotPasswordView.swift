//
//  ForgotPasswordView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 08.10.2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    let device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        ZStack {
            Color(.backgroundMain)
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 15) {
                    Text("forgot-password")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("forgot-password-text")
                        .font(.subheadline)
                }
                .foregroundStyle(.labelsMain)
                .padding(.bottom, 15)
                
                if device == .phone {
                    AuthInputField(imageName: "envelope", placeholder: "email-field", text: $email)
                        .padding(.bottom, 4)
                        .padding(.horizontal, 6)
                } else if device == .pad {
                    AuthInputField(imageName: "envelope", placeholder: "email-field", text: $email)
                        .padding(.bottom, 4)
                        .padding(.horizontal, 150)
                }
                
                
                Button {
                    print("Password Reset")
                } label: {
                    AuthButton(title: "reset-password-button")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ForgotPasswordView()
            .environment(\.locale, .init(identifier: "ru"))
    }
    .tint(.labelsMain)
}

#Preview {
    NavigationStack {
        ForgotPasswordView()
            .environment(\.locale, .init(identifier: "en"))
    }
    .tint(.labelsMain)
}
