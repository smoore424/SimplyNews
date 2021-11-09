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

//let categories: [Category] = [
//    Category(color: .systemTeal, text: "All", image: UIImage(systemName: "doc.richtext")!),
//    Category(color: .systemBlue, text: "Business", image: UIImage(systemName: "dollarsign.circle")!),
//    Category(color: .systemPink, text: "Entertainmant", image: UIImage(systemName: "guitars")!),
//    Category(color: .systemYellow, text: "General", image: UIImage(systemName: "person.and.person")!),
//    Category(color: .systemRed, text: "Health", image: UIImage(systemName: "bandage")!),
//    Category(color: .systemGreen, text: "Science", image: UIImage(systemName: "radiowaves.left")!),
//    Category(color: .systemOrange, text: "Sports", image: UIImage(systemName: "sportscourt")!),
//    Category(color: .systemBrown, text: "Technology", image: UIImage(systemName: "desktopcomputer")!)
//]

let categories: [Category] = [
    Category(color: .systemTeal, text: "All", image: UIImage(named: "all")!),
    Category(color: .systemBlue, text: "Business", image: UIImage(named: "business")!),
    Category(color: .systemPink, text: "Entertainmant", image: UIImage(named: "entertainment")!),
    Category(color: .systemYellow, text: "General", image: UIImage(named: "general")!),
    Category(color: .systemRed, text: "Health", image: UIImage(named: "health")!),
    Category(color: .systemGreen, text: "Science", image: UIImage(named: "science")!),
    Category(color: .systemOrange, text: "Sports", image: UIImage(named: "sports")!),
    Category(color: .systemBrown, text: "Technology", image: UIImage(named: "technology")!)
]
