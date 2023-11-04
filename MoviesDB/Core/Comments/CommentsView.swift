//
//  CommentsView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 12.10.2023.
//

import SwiftUI

struct CommentsView: View {
    private enum Field: Hashable {
        case commentField
    }
    @State private var commentText = ""
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("comments-title")
                .padding(.top, 20)
            
            Divider()
            
            ScrollView {
                ForEach(0...10, id: \.self) { _ in
                    CommentCell()
                        .padding(.horizontal, 8)
                        .padding(.bottom)
                }
            }
            .onTapGesture {
                focusedField = nil
            }
            
            HStack(alignment: .bottom) {
                CircularProfileImageView(imageUrl: "max", size: .medium)
                
                ZStack {
                    TextField("comment-input", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 9)
                        .padding(.vertical, 10)
                        .frame(minHeight: 40)
                        .overlay {
                            RoundedRectangle(cornerRadius: 9)
                                .stroke(.gray, lineWidth: 1)
                        }
                        .focused($focusedField, equals: .commentField)
                }
                
                
                Button {
                    print("DEBUG: Comment added")
                    focusedField = nil
                    dismiss()
                } label: {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundStyle(.labelsMain)
                }
                
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
        }
    }
}

#Preview {
    CommentsView()
        .environment(\.locale, .init(identifier: "ru"))
        .preferredColorScheme(.light)
}

#Preview {
    CommentsView()
        .environment(\.locale, .init(identifier: "en"))
        .preferredColorScheme(.dark)
}
