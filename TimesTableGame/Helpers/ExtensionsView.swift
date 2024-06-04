//
//  ExtensionsView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}
