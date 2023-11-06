//
//  ExploreView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cellBackground)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        TextField("search-input", text: $searchText)
                            .padding(8)
                            .padding(.horizontal, 24)
                            .textInputAutocapitalization(.never)
                            .overlay {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundStyle(.labelsMain)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)
                                }
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 9)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom, 10)
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(User.MOCK_USERS) { user in
                                NavigationLink {
                                    UserProfileView(user: user)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ExploreCellView(user: user)
                                }
                                .padding(.trailing, 4)

                            }
                            .padding(.vertical, 1)
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .foregroundStyle(.labelsMain)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("explore-title")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.labelsMain)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
        .preferredColorScheme(.light)
        .environment(\.locale, .init(identifier: "ru"))
}

#Preview {
    ExploreView()
        .preferredColorScheme(.dark)
        .environment(\.locale, .init(identifier: "en"))
}
