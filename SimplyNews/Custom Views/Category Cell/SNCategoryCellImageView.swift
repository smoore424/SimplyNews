//
//  SNCategoryCellImageView.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/20/21.
//

import UIKit

class SNCategoryCellImageView: UIImageView {

    var cellImage: UIImage!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
