//
//  AccountView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 19.10.2023.
//

import SwiftUI

struct AccountView: View {
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.feedCellBackground)
                .ignoresSafeArea()
            
            VStack {
                CircularProfileImageView(imageUrl: "max", size: .xLarge)
                
                
                Button {
                    print("DEBUG: Present photo picker")
                } label: {
                    Text("Change profile image")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.labelsMain)
                }
                .padding(.bottom, 20)
                
                HStack {
                    Text("Username:")
                        .frame(width: 80, alignment: .leading)
                    
                    TextField("Username", text: $username)
                        .padding(10)
                        .frame(height: 30)
                        .background(.inputBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                }
                .font(.subheadline)
                .foregroundStyle(.labelsMain)
                .padding(.horizontal)
                
                HStack {
                    Text("Fullname:")
                        .frame(width: 80, alignment: .leading)
                    
                    TextField("Fullname", text: $fullname)
                        .padding(10)
                        .frame(height: 30)
                        .background(.inputBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                }
                .font(.subheadline)
                .foregroundStyle(.labelsMain)
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                Button {
                    print("DEBUG: Changes saved")
                    dismiss()
                } label: {
                    Text("Save Changes")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.backgroundMain)
                        .frame(width: 320, height: 40)
                        .background(.labelsMain)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
                
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
                    Text("Account Settings")
                        .foregroundStyle(.labelsMain)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AccountView()
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        AccountView()
            .preferredColorScheme(.dark)
    }
}
