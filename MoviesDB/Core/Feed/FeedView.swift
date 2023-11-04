//
//  FeedView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundMain)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        ForEach(Movie.MOCK_MOVIES, id: \.self) { movie in
                            NavigationLink {
                                MovieView(movie: movie)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                FeedCell(movie: movie)
                            }
                        }
                    }
                }
                .refreshable {
                    print("nandle refresh")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("feed-name")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.labelsMain)
                }
            }
        }
    }
}

#Preview {
    FeedView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    FeedView()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
