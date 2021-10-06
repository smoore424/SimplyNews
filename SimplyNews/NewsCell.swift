//
//  CustomCell.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/5/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var headlineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    lazy var timestampLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsImageView)
        addSubview(headlineLabel)
        addSubview(timestampLabel)
        setImageUI()
        setHeadlineLabelUI()
        setTimestampLabelUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(newsItem: News) {
        //TODO: Adjust to match info needed from API call
        newsImageView.image = newsItem.image
        headlineLabel.text = newsItem.headline
        timestampLabel.text = newsItem.timeStamp
    }
    
    func setImageUI() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            newsImageView.heightAnchor.constraint(equalToConstant: 92),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 4/3)
        ])
    }
    
    func setHeadlineLabelUI() {
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            headlineLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -12),
            headlineLabel.heightAnchor.constraint(equalToConstant: 92)
        ])
    }
    
    func setTimestampLabelUI() {
        timestampLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timestampLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 6),
            timestampLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            timestampLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            timestampLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6)
        ])
    }
}
