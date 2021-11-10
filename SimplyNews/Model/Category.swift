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
    let categoryID: CategoryType
    
    init(color: UIColor, text: String, image: UIImage, categoryID: CategoryType) {
        self.color = color
        self.text = text
        self.image = image
        self.categoryID = categoryID
    }
}

let categories: [Category] = [
    Category(color: .systemTeal, text: "General", image: UIImage(named: "general")!, categoryID: .general),
    Category(color: .systemBlue, text: "Business", image: UIImage(named: "business")!, categoryID: .business),
    Category(color: .systemPink, text: "Entertainmant", image: UIImage(named: "entertainment2")!, categoryID: .entertainment),
    Category(color: .systemRed, text: "Health", image: UIImage(named: "health")!, categoryID: .health),
    Category(color: .systemGreen, text: "Science", image: UIImage(named: "science")!, categoryID: .science),
    Category(color: .systemOrange, text: "Sports", image: UIImage(named: "sports")!, categoryID: .sports),
    Category(color: .systemBrown, text: "Technology", image: UIImage(named: "technology")!, categoryID: .technology)
]
