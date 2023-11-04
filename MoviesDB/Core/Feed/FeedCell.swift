//
//  FeedCell.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 09.10.2023.
//

import SwiftUI

struct FeedCell: View {
    let movie: Movie
    var likeImage: String {
        return postLiked ? "heart.fill" : "heart"
    }
    @State private var showComments = false
    @State var postLiked = false
    
    var body: some View {
        ZStack {
            Color(.feedCellBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .opacity(0.8)
                .padding(.horizontal, 7)
            
            VStack(alignment: .leading) {
                // Avatar + username
                FeedCellHeader()
                
                // Movie poster, title, userscore
                HStack(alignment: .top, spacing: 15) {
                    Image(movie.posterUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("my-rating")
                                .fontWeight(.semibold)
                            Text("9.8/10")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                        
                        HStack {
                            Text("my-review")
                                .fontWeight(.semibold)
                            +
                            Text("This is super long review for test purposes and debugging UI")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                        
                    }
                    .multilineTextAlignment(.leading)
                }
                .padding(.bottom, 5)
                
                // Like, add comment button
                HStack(alignment: .top, spacing: 20) {
                    Button {
                        withAnimation(.easeInOut) {
                            postLiked.toggle()
                        }
                    } label: {
                        Image(systemName: likeImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                    
                    Button {
                        showComments.toggle()
                    } label: {
                        Image(systemName: "bubble")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                }
                .padding(.bottom, 5)
                
                // number of likes
                HStack {
                    Text("likes")
                        .fontWeight(.semibold)
                    
                    Text("250")
                    
                    Spacer()
                    
                    Text("time-ago")
                        .foregroundStyle(.gray)
                }
                .font(.footnote)
                
                // Comment cell
                
                HStack {
                    Text("test-user ")
                        .fontWeight(.semibold)
                    +
                    Text("This is a comment to test the alignment and multilines in comment section")
                }
                .font(.footnote)
                .multilineTextAlignment(.leading)
                
                
                HStack {
                    Button {
                        showComments.toggle()
                    } label: {
                        HStack {
                            Text("show-comments-btn")
                            +
                            Text("(72)")
                        }
                        .foregroundStyle(.gray)
                        .font(.footnote)
                    }
                }
                
                
                
            }
            .sheet(isPresented: $showComments, content: {
                CommentsView()
                    .presentationDetents([.fraction(0.8)])
            })
            .foregroundStyle(.labelsMain)
            .padding(.horizontal)
            .padding(.vertical, 13)
        }
    }
}

#Preview {
    FeedCell(movie: Movie.MOCK_MOVIES[1])
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    FeedCell(movie: Movie.MOCK_MOVIES[2])
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
