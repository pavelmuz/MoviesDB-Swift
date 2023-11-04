//
//  GoogleAppleBtnsView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 08.10.2023.
//

import SwiftUI

struct GoogleAppleBtnsView: View {
    var body: some View {
        HStack(spacing: 10) {
            Button {
                print("Sign up with Google")
            } label: {
                Image(.google)
                    .resizable()
                    .modifier(GoogleAppleBtnsModifier())
            }
            
            Button {
                print("Sign up with Apple")
            } label: {
                Image(.appleLogo)
                    .resizable()
                    .modifier(GoogleAppleBtnsModifier())
            }
        }
    }
}

#Preview {
    GoogleAppleBtnsView()
}
