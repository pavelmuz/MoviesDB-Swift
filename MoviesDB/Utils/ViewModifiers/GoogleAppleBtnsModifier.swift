//
//  GoogleAppleBtnsModifier.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 08.10.2023.
//

import SwiftUI

struct GoogleAppleBtnsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 30)
            .frame(width: 72, height: 40)
            .background(.labelsMain)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
