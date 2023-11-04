//
//  EditPostView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 27.10.2023.
//

import SwiftUI

struct EditPostView: View {
    @State private var rating = ""
    @State private var review = ""
    @Binding var showEditPost: Bool
    let device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("my-rating")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                TextField("rating-input", text: $rating)
                    .font(.footnote)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(.gray, lineWidth: 1)
                    }
                
                Text("my-review")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                TextField("review-input", text: $review, axis: .vertical)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 10)
                    .frame(minHeight: 40)
                    .overlay {
                        RoundedRectangle(cornerRadius: 9)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
            .foregroundStyle(.labelsMain)
            .padding(.horizontal)
            .padding(.bottom)
            
            Divider()
                .padding(.bottom)
            
            VStack(spacing: 10) {
                Button {
                    print("DEBUG: Saved changes to post")
                    showEditPost = false
                } label: {
                    Text("save-post")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.labelsMain)
                }
                
                Button {
                    showEditPost = false
                } label: {
                    Text("cancel-edit")
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
        .frame(width: device == .phone ? 300 : 500)
        .frame(minHeight: 300)
        .background(.feedCellBackground)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 0.5)
                .foregroundStyle(.labelsMain)
        }
        
        
        
        
        
    }
}

#Preview {
    EditPostView(showEditPost: .constant(true))
        .preferredColorScheme(.dark)
}
