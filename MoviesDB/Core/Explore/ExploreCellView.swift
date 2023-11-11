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
                    FollowButton(followed: followed, subscribeTitle: subscribeTitle)
                }
            }
            Divider()
        }
    }
}

#Preview {
    ExploreCellView(user: User.MOCK_USERS[2])
}
