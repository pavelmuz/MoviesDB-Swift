//
//  UserProfileView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 06.11.2023.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @State private var selectedFilter: ProfileFilterViewModel = .movies
    @Namespace var animation
    let device = UIDevice.current.userInterfaceIdiom
    @Environment(\.dismiss) var dismiss
    @State var followed = false
    var subscribeTitle: LocalizedStringKey {
        return followed ? "following" : "follow"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundMain)
                    .ignoresSafeArea()
                
                VStack {
                    // Header
                    HStack(alignment: .top, spacing: 15) {
                        // Profile image
                        CircularProfileImageView(imageUrl: user.profileImageUrl, size: .xLarge)
                        
                        // Username and fullname
                        VStack(alignment: .leading, spacing: 6) {
                            Text(user.username)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                                .font(.subheadline)
                            
                            Button {
                                followed.toggle()
                            } label: {
                                Text(subscribeTitle)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(followed ? .backgroundMain : .labelsMain)
                                    .frame(width: 180, height: 27)
                                    .background(followed ? .labelsMain : .backgroundMain)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(lineWidth: 1)
                                    }
                            }
                        }
                        
                        Spacer()

                    }
                    .padding(.vertical)
                    
                    
                    // Filter buttons
                    HStack {
                        ForEach(ProfileFilterViewModel.allCases, id: \.rawValue) { item in
                            VStack {
                                Text(item.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == item ? .bold : .regular)
                                    .foregroundStyle(selectedFilter == item ? .labelsMain : .gray)
                                
                                if selectedFilter == item {
                                    Capsule()
                                        .foregroundStyle(.labelsMain)
                                        .frame(height: 3)
                                        .matchedGeometryEffect(id: "filter", in: animation)
                                } else {
                                    Capsule()
                                        .foregroundStyle(.clear)
                                        .frame(height: 3)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedFilter = item
                                }
                            }
                        }
                    }
                    .overlay {
                        Divider()
                            .offset(x: 0, y: 14)
                    }
                    
                    ScrollView {
                        LazyVStack {
                            if selectedFilter == .movies {
                                ForEach(Movie.MOCK_MOVIES, id: \.self) { movie in
                                    UserFeedCellView(movie: movie)
                                }
                            } else if selectedFilter == .followers {
                                ForEach(0...40, id: \.self) { _ in
                                    ExploreCellView(user: User.MOCK_USERS[1])
                                }
                            } else if selectedFilter == .following {
                                ForEach(User.MOCK_USERS, id: \.self) { user in
                                    ExploreCellView(user: user)
                                }
                            }
                        }
                    }
                    .scrollIndicators(selectedFilter != .movies ? .visible : .hidden)
                    .refreshable {
                        print("DEBUG Handle refreshing posts")
                    }
                    
                    
                    Spacer()
                }
                .padding(.horizontal, 10)
                .foregroundStyle(.labelsMain)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.labelsMain)
                    }
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        UserProfileView(user: User.MOCK_USERS[0])
            .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview {
    NavigationStack {
        UserProfileView(user: User.MOCK_USERS[0])
            .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
    }
}
