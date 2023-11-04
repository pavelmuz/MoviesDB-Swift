//
//  FeedCellHeader.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 18.10.2023.
//

import SwiftUI

struct FeedCellHeader: View {
    var body: some View {
        HStack {
            CircularProfileImageView(imageUrl: "max", size: .medium)
            
            Text("maxxx")
                .font(.subheadline)
            
            Spacer()
        }
    }
}

#Preview {
    FeedCellHeader()
}
