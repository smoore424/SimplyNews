//
//  News.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/5/21.
//

import UIKit

struct News {
    let image: UIImage
    let headline: String
    let timeStamp: String
    
    init(image: UIImage, headline: String, timeStamp: String) {
        self.image = image
        self.headline = headline
        self.timeStamp = timeStamp
    }
}
