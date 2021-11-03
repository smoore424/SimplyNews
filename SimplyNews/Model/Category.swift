//
//  Category.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/20/21.
//

import UIKit

struct Category {
    let color: UIColor
    let text: String
    let image: UIImage
    
    init(color: UIColor, text: String, image: UIImage) {
        self.color = color
        self.text = text
        self.image = image
    }
}

let categories: [Category] = [
    Category(color: .systemTeal, text: "All", image: UIImage(systemName: "doc.richtext")!),
    Category(color: .systemBlue, text: "Business", image: UIImage(systemName: "dollarsign.circle")!),
    Category(color: .systemPink, text: "Entertainmant", image: UIImage(systemName: "guitars")!),
    Category(color: .systemYellow, text: "General", image: UIImage(systemName: "person.and.person")!),
    Category(color: .systemRed, text: "Health", image: UIImage(systemName: "bandage")!),
    Category(color: .systemGreen, text: "Science", image: UIImage(systemName: "radiowaves.left")!),
    Category(color: .systemOrange, text: "Sports", image: UIImage(systemName: "sportscourt")!),
    Category(color: .systemBrown, text: "Technology", image: UIImage(systemName: "desktopcomputer")!)
]

