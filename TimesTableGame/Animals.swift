//
//  Animals.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 05/06/24.
//

import Foundation

final class Animal {
    private var name: String
    private var normalImage: String
    private var squareImage: String
    
    init(name: String, normalImage: String, squareImage: String) {
        self.name = name
        self.normalImage = normalImage
        self.squareImage = squareImage
    }
}
