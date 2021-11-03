//
//  SNCategoryCellLabel.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/20/21.
//

import UIKit

class SNCategoryCellLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
    }
    
    
    private func configure() {
        font = UIFont.preferredFont(forTextStyle: .subheadline)
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}
