//
//  AuthFooter.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct AuthFooter: View {
    let title1: LocalizedStringKey
    let title2: LocalizedStringKey
    
    var body: some View {
        HStack {
            Text(title1)
            
            Text(title2)
                .fontWeight(.semibold)
            
        }
        .font(.footnote)
        .foregroundStyle(.labelsMain)
    }
}

#Preview {
    AuthFooter(title1: "Don't have an account?", title2: "Sign Up!")
}
