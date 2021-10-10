//
//  SNTimestampLabel.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/10/21.
//

import UIKit

class SNTimestampLabel: UILabel {

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
        font = UIFont.preferredFont(forTextStyle: .caption1)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
