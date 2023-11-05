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
                Text("about-caption")
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
                    Text("about-title")
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
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview {
    NavigationStack {
        AboutView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
