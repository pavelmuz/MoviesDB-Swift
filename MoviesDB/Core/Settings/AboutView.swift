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
            Color(.feedCellBackground)
                .ignoresSafeArea()
            
            VStack {
                
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
                
                ToolbarItem(placement: .principal) {
                    Text("About")
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
