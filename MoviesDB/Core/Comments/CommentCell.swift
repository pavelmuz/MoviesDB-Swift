//
//  CommentCell.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 12.10.2023.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack(alignment: .top) {
            CircularProfileImageView(imageUrl: User.MOCK_USERS[1].profileImageUrl, size: .small)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("test-user")
                        .fontWeight(.semibold)
                    
                    Text("time-ago")
                        .foregroundStyle(.gray)
                }
                
                Text("This is a dummy comment to test alignment in user interface of comment cell")
            }
            .font(.footnote)
            .multilineTextAlignment(.leading)
            
            Spacer()
        }
    }
}

#Preview {
    CommentCell()
}
