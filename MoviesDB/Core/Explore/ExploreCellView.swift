//
//  ExploreCellView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 13.10.2023.
//

import SwiftUI

struct ExploreCellView: View {
    let user: User
    @State var followed = false
    var subscribeTitle: LocalizedStringKey {
        return followed ? "following" : "follow"
    }
    
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView(imageUrl: user.profileImageUrl, size: .medium)
                
                VStack(alignment: .leading) {
                    Text(user.username)
                        .fontWeight(.semibold)
                    
                    Text(user.fullname)
                }
                .font(.footnote)
                
                Spacer()
                
                Button {
                    followed.toggle()
                } label: {
                    Text(subscribeTitle)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(followed ? .cellBackground : .labelsMain)
                        .frame(width: 140, height: 30)
                        .background(followed ? .labelsMain : .cellBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(followed ? .cellBackground : .labelsMain)
                        }
                }
            }
            Divider()
        }
    }
}

#Preview {
    ExploreCellView(user: User.MOCK_USERS[2])
}
