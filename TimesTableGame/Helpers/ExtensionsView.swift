//
//  ExtensionsView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import Foundation
import SwiftUI

extension View {
    //apply cornerRadius to a view, passing to it the corners  and de radius
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
    
    //apply hidden conditionally to a view
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
