//
//  CategoryCell.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/20/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseID = "CategoryCell"
    
    let imageView = SNCategoryCellImageView(frame: .zero)
    let label = SNCategoryCellLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCells(for indexPath: Int) {
        let category = categories
        layer.borderColor = category[indexPath].color.cgColor
        label.text = category[indexPath].text
        label.textColor = category[indexPath].color
        
        imageView.image = category[indexPath].image
        imageView.tintColor = category[indexPath].color
//        for category in categories {
//            layer.borderColor = category.color.cgColor
//            label.text = category.text
//            label.textColor = category.color
//
//            imageView.image = category.image
//            imageView.tintColor = category.color
//        }
    }
    
    private func configure() {
        layer.borderWidth = 2
        
        addSubview(imageView)
        addSubview(label)
        
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
