//
//  CircularProfileImageView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 12.10.2023.
//

import SwiftUI

enum ProfileImageSize {
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .small: return 25
        case .medium: return 40
        case .large: return 60
        case .xLarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    let imageUrl: String
    let size: ProfileImageSize
    
    var body: some View {
        Image(imageUrl)
            .resizable()
            .scaledToFit()
            .frame(width: size.dimension, height: size.dimension)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView(imageUrl: "avatar", size: .large)
}
