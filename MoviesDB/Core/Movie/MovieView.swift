//
//  MovieView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 10.10.2023.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.backgroundMain)
                .ignoresSafeArea()
            
            ScrollView {
                ZStack {
                    // Card background
                    Color(.cellBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(8)
                    
                    
                    VStack {
                        // Movie poster
                        Image(movie.posterUrl)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 330)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom, 9)
                        
                        // Release date
                        HStack {
                            Text("movie-year")
                                .fontWeight(.semibold)
                            
                            Text(String(movie.year))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                        .font(.subheadline)
                        
                        // Movie description
                        Text(movie.description)
                            .font(.subheadline)
                            .padding(.bottom)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        // Open Kinoposik link
                        Link(destination: URL(string: movie.kinopoiskUrl)!, label: {
                            Text("kinopoisk-button")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.backgroundMain)
                                .frame(width: 320, height: 40)
                                .background(.labelsMain)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                    }
                    .multilineTextAlignment(.leading)
                    .lineLimit(9)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 35)
                }
                
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
                Text(movie.title)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        .foregroundStyle(.labelsMain)
    }
}

#Preview {
    NavigationStack {
        MovieView(movie: Movie.MOCK_MOVIES[0])
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview {
    NavigationStack {
        MovieView(movie: Movie.MOCK_MOVIES[2])
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
