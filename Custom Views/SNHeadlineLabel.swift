//
//  SNHeadlineLabel.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/10/21.
//

import UIKit

class SNHeadlineLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }

    private func configure() {
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byWordWrapping
        
        font = UIFont.preferredFont(forTextStyle: .title1)
        textColor = .label
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
