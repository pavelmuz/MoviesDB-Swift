//
//  ProfileFeedCellPopoverView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 26.10.2023.
//

import SwiftUI

struct ProfileFeedCellPopoverView: View {
    @Binding var showEditPost: Bool
    @Binding var showPostOptions: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Button {
                    showEditPost = true
                    showPostOptions = false
                } label: {
                    HStack {
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .foregroundStyle(.orange)
                            .scaledToFit()
                            .frame(width: 20)
                        Text("edit-post")
                        .foregroundStyle(.labelsMain)                }
                }
                
                Button {
                    print("DEBUG: Post deleted")
                } label: {
                    HStack {
                        Image(systemName: "trash.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .scaledToFit()
                            .frame(width: 20)
                        Text("delete-post")
                            .foregroundStyle(.labelsMain)
                    }
                }
            }
            .padding(.leading, 15)
            .font(.subheadline)
            
            Spacer()
        }
    }
}

#Preview {
    ProfileFeedCellPopoverView(showEditPost: .constant(false), showPostOptions: .constant(false))
}
