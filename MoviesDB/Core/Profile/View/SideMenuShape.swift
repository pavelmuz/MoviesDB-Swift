//
//  SideMenuShape.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 26.10.2023.
//

import SwiftUI

struct SideMenuShape: Shape {
    let device: UIUserInterfaceIdiom
    var corner: UIRectCorner{
        if device == .phone { return .topRight }
        if device == .pad { return .bottomLeft }
        return .allCorners
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    .topLeft,
                                    corner
                                    
                                ],
                                cornerRadii: CGSize(width: 25, height: 25)
        )
        return Path(path.cgPath)
    }
    
}
