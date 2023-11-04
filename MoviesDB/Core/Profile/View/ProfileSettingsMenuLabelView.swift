//
//  ProfileSettingsMenuLabelView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 19.10.2023.
//

import SwiftUI

struct ProfileSettingsMenuLabelView: View {
    let imageName: String
    let title: LocalizedStringKey
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            Text(title)
                .font(.system(size: 18))
        }
    }
}

#Preview {
    ProfileSettingsMenuLabelView(imageName: "person.circle", title: "Account")
}
