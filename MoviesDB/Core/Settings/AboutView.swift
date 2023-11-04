//
//  AboutView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 20.10.2023.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.backgroundMain)
                .ignoresSafeArea()
            
            VStack {
                Text("This app was created as a portfolio project to gain experiance in SwiftUI, Firebase and othe back-end services. \n\nIn this app you can create personal rating with Movies and TV Shows, interact with other users.")
                    .multilineTextAlignment(.leading)
                    .font(.subheadline)
                    .foregroundStyle(.labelsMain)
                    .padding(.bottom)
                
                HStack {
                    Text("© Pavel Muzalevskiy, 2023")
                        .font(.subheadline)
                    .foregroundStyle(.labelsMain)
                    
                    Link(destination: URL(string: "https://github.com/pavelmuz")!, label: {
                        Image(.github)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                    })
                }
               
                
                
                Spacer()
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.labelsMain)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("About")
                        .font(.headline)
                        .foregroundStyle(.labelsMain)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AboutView()
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        AboutView()
            .preferredColorScheme(.dark)
    }
}
