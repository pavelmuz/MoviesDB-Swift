//
//  ProfileView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct ProfileView: View {
    private var user: User? {
        return User.MOCK_USERS[0]
    }
    @State private var selectedFilter: ProfileFilterViewModel = .movies
    @State var showSideMenu: Bool = false
    @State var showEditPost = false
    @Namespace var animation
    let device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.feedCellBackground)
                    .ignoresSafeArea()
                
                VStack {
                    // Header
                    HStack(alignment: .top, spacing: 15) {
                        // Profile image
                        CircularProfileImageView(imageUrl: user!.profileImageUrl, size: .xLarge)
                        
                        // Username and fullname
                        VStack(alignment: .leading, spacing: 6) {
                            Text(user!.username)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text(user!.fullname)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        // Presenting options menu button
                        
                        Button {
                            withAnimation(.easeInOut) {
                                showSideMenu.toggle()
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }
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
                                    ProfileFeedCellView(movie: movie, showEditPost: $showEditPost)
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
                .onTapGesture {
                    showSideMenu = false
                }
                .opacity(showEditPost || showSideMenu ? 0.2 : 1)
                
                
                if showSideMenu {
                        ProfileSettingsMenuView()
                }

                
                if showEditPost {
                    EditPostView(showEditPost: $showEditPost)
                }
                
                
                
            }
            .onAppear {
                showSideMenu = false
            }
        }
        
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
