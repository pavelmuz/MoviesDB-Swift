//
//  AuthHeader.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct AuthHeader: View {
    var body: some View {
        VStack {
            Image(.logo)
                .resizable()
                .scaledToFill()
            .frame(width: 250, height: 250)
            
            Text("Movie Base")
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .foregroundStyle(.labelsMain)
        }
    }
}

#Preview {
    AuthHeader()
}
