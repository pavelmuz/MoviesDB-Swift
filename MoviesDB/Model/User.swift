//
//  User.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 13.10.2023.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    let username: String
    let fullname: String
    let profileImageUrl: String
}

extension User {
    static let MOCK_USERS: [User] = [
        User(
            id: NSUUID().uuidString,
            username: "maxxx",
            fullname: "Max Verstappen",
            profileImageUrl: "max"
        ),
        User(
            id: NSUUID().uuidString,
            username: "fernando3000",
            fullname: "Fernando Alonso",
            profileImageUrl: "alonso"
        ),
        User(
            id: NSUUID().uuidString,
            username: "seb100",
            fullname: "Sebastian Vettel",
            profileImageUrl: "seb"
        ),
        User(
            id: NSUUID().uuidString,
            username: "lando",
            fullname: "Lando Norris",
            profileImageUrl: "lando"
        )
    ]
}
