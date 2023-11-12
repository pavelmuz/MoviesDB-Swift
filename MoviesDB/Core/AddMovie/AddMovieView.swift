//
//  AddMovieView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 07.10.2023.
//

import SwiftUI

struct AddMovieView: View {
    @State private var movieTitle = ""
    let device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.backgroundMain)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Add Movie")
                        .font(.title2)
                        .foregroundStyle(.labelsMain)
                    
                    TextField("Search movie", text: $movieTitle)
                        .font(.headline)
                        .foregroundStyle(.labelsMain )
                        .padding(12)
                        .frame(height: 35)
                        .background(.inputBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .padding(.horizontal, device == .phone ? 20 : 100)
                        
                    
                    NavigationLink {
                        SearchResultView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Search")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.backgroundMain)
                            .frame(width: 200, height: 40)
                            .background(.labelsMain)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .disabled(movieTitle == "")

                    
                }
            }
        }
    }
}

#Preview {
    AddMovieView()
        .preferredColorScheme(.light)
}

#Preview {
    AddMovieView()
        .preferredColorScheme(.dark)
}
