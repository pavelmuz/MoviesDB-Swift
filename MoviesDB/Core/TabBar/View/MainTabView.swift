//
//  MainTabView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("home")
                    }
                        
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("explore")
                    }
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            AddMovieView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 2 ? "plus.square.fill" : "plus.square")
                            .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                        Text("add-movie")
                    }
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            LikesView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("likes-tab")
                    }
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("profile-tab")
                    }
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
        }
        .tint(.labelsMain)
    }
}

#Preview {
    MainTabView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    MainTabView()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
