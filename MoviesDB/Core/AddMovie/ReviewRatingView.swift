//
//  ReviewRatingView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 12.11.2023.
//

import SwiftUI

struct ReviewRatingView: View {
    @Environment(\.dismiss) var dismiss
    let device = UIDevice.current.userInterfaceIdiom
    let movie: Movie
    
    var body: some View {
        ZStack {
            Color(.backgroundMain)
                .ignoresSafeArea()
            
            VStack {
                Text(movie.title)
                Image(movie.posterUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Add Rating")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        .foregroundStyle(.labelsMain)
    }
}

#Preview {
    NavigationStack {
        ReviewRatingView(movie: Movie.MOCK_MOVIES[1])
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        ReviewRatingView(movie: Movie.MOCK_MOVIES[1])
            .preferredColorScheme(.dark)
    }
}
