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
    @State private var rating = ""
    @State private var review = ""
    
    var body: some View {
        ZStack {
            Color(.backgroundMain)
                .ignoresSafeArea()
            
            VStack {
                HStack(alignment: .top) {
                    Image(movie.posterUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: device == .phone ? 100 : 150)
                    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("my-rating")
                            
                            TextField("rating-input", text: $rating)
                                .padding(.horizontal, 8)
                                .frame(height: 25)
                                .background(.inputBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                        Text("my-review")
                        
                        TextField("review-input", text: $review, axis: .vertical)
                            .padding(.horizontal, 8)
                            .frame(minHeight: 25)
                            .background(.inputBackground)
                            .multilineTextAlignment(.leading)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .font(.subheadline)
                }
                
                Spacer()
            }
            .padding(.horizontal, device == .phone ? 20 : 40)
            .padding(.top)
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
                Text("add-rating-title")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("DEBUG: Movie added")
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.labelsMain)
                }
            }
        }
        .foregroundStyle(.labelsMain)
    }
}

#Preview {
    NavigationStack {
        ReviewRatingView(movie: Movie.MOCK_MOVIES[1])
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview {
    NavigationStack {
        ReviewRatingView(movie: Movie.MOCK_MOVIES[1])
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
