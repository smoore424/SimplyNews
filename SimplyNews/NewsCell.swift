//
//  CustomCell.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/5/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let newsImageView = SNNewsImageView(cornerRadius: 10)
    let headlineLabel = SNHeadlineLabel(textAlignment: .left)
    let timestampLabel = SNTimestampLabel(textAlignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureNewsImageView()
        configureHeadlineLabel()
        configureTimestampLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   public func set(newsItem: News) {
        //TODO: Adjust to match info needed from API call
        newsImageView.image = newsItem.image
        headlineLabel.text = newsItem.headline
        timestampLabel.text = newsItem.timeStamp
    }
    
    func configureNewsImageView() {
        addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: K.newsCellPadding),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.newsCellPadding),
            newsImageView.heightAnchor.constraint(equalToConstant: 92),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 4/3)
        ])
    }
    
    func configureHeadlineLabel() {
        addSubview(headlineLabel)
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: K.newsCellPadding),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.newsCellPadding),
            headlineLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -K.newsCellPadding),
            headlineLabel.heightAnchor.constraint(equalToConstant: 92)
        ])
    }
    
    func configureTimestampLabel() {
        addSubview(timestampLabel)
        
        NSLayoutConstraint.activate([
            timestampLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 6),
            timestampLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.newsCellPadding),
            timestampLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.newsCellPadding),
            timestampLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6)
        ])
    }
}

