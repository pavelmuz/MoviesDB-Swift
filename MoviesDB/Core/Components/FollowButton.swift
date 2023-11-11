//
//  FollowButton.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 11.11.2023.
//

import SwiftUI

struct FollowButton: View {
    let followed: Bool
    let subscribeTitle: LocalizedStringKey
    
    var body: some View {
        Text(subscribeTitle)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(followed ? .backgroundMain : .labelsMain)
            .frame(width: 140, height: 30)
            .background(followed ? .labelsMain : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(followed ? .backgroundMain : .labelsMain)
            }
    }
}

#Preview {
    FollowButton(followed: false, subscribeTitle: "follow")
}
