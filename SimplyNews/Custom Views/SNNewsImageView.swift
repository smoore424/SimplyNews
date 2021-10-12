//
//  SNNewsImageView.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/10/21.
//

import UIKit

class SNNewsImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
