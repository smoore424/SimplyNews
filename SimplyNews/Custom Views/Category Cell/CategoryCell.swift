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
        backgroundColor = .systemBackground
        let category = categories
        layer.borderColor = category[indexPath].color.cgColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
        label.text = category[indexPath].text
        
        imageView.image = category[indexPath].image.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = category[indexPath].color
    }
    
    
    func getCategoryID(for indexPath: Int) -> CategoryType {
        let category = categories
        return category[indexPath].categoryID
    }
    
    private func configure() {
        layer.borderWidth = 2
        
        addSubview(imageView)
        addSubview(label)
        
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            label.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
}
