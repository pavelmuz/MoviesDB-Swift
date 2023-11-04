//
//  NotificationsView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 19.10.2023.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var emailNotifications = false
    @State private var pushNotifications  = false
    
    var body: some View {
        ZStack {
            Color(.feedCellBackground)
                .ignoresSafeArea()
            
            VStack {
                Toggle("Notifications with email", isOn: $emailNotifications)
                    .tint(.labelsMain)
                    .foregroundStyle(.labelsMain)
                    .font(.headline)
                
                
                Toggle("Push notifications", isOn: $pushNotifications)
                    .tint(.labelsMain)
                    .foregroundStyle(.labelsMain)
                    .font(.headline)
                
                Spacer()
            }
            .padding(.horizontal)
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
                    Text("Notifications")
                        .foregroundStyle(.labelsMain)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NotificationsView()
            .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        NotificationsView()
            .preferredColorScheme(.dark)
    }
}
