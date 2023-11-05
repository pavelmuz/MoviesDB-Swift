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
            Color(.cellBackground)
                .ignoresSafeArea()
            
            Form {
                Toggle("mail-notifications", isOn: $emailNotifications)
                    .tint(.labelsMain)
                    .foregroundStyle(.labelsMain)
                
                
                Toggle("push-nitifications", isOn: $pushNotifications)
                    .tint(.labelsMain)
                    .foregroundStyle(.labelsMain)
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
                    Text("notifications-title")
                        .font(.headline)
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
            .environment(\.locale, .init(identifier: "ru"))
    }
}

#Preview {
    NavigationStack {
        NotificationsView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "en"))
    }
}
