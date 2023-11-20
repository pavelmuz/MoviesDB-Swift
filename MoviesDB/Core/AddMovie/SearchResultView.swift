//
//  SearchResultView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 12.11.2023.
//

import SwiftUI

struct SearchResultView: View {
    @Environment(\.dismiss) var dismiss
    let device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        ZStack {
            Color(.backgroundMain)
                .ignoresSafeArea()
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(Movie.MOCK_MOVIES, id: \.self) { movie in
                        NavigationLink {
                            ReviewRatingView(movie: movie)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(movie.title)
                                .font(.title3)
                                .foregroundStyle(.labelsMain)
                                .padding(.bottom, 2)
                        }

                    }
                }
                .padding(.horizontal, device == .phone ? 20 : 40)
            }
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
                Text("select-movie")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        .foregroundStyle(.labelsMain)
    }
}

#Preview {
    NavigationStack {
        SearchResultView()
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview {
    NavigationStack {
        SearchResultView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
