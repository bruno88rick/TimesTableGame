//
//  RoundedCorners.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import Foundation
import SwiftUI

// apply RoundedCorners to a shape, pssing to it the corners and the radius
struct RoundedCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
