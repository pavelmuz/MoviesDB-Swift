//
//  ProfileFilterViewModel.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 15.10.2023.
//

import Foundation

enum ProfileFilterViewModel: Int, CaseIterable {
    case movies
    case followers
    case following
    
    var title: LocalizedStringResource {
        switch self {
        case .movies: return "movies-tab"
        case .followers: return "followers-tab"
        case .following: return "following-tab"
        }
    }
}
