//
//  CustomCell.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/5/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let newsImageView = SNNewsImageView(frame: .zero)
    let headlineLabel = SNHeadlineLabel(textAlignment: .left, textColor: .label)
    let timestampLabel = SNTimestampLabel(textAlignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureNewsImageView()
        configureTimestampLabel()
        configureHeadlineLabel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func set(newsItem: Article, withImage: Bool) {

        if withImage {
            newsImageView.downloadImage(from: newsItem.urlToImage ?? "")
        } else {
            setNoImageConstraints()
        }
        
        headlineLabel.text = newsItem.title
        timestampLabel.text = newsItem.publishedAt.convertToDisplayFormat()
    }
    
    
    func configureNewsImageView() {
        addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: K.newsCellPadding),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.newsCellPadding),
            newsImageView.heightAnchor.constraint(equalToConstant: 92),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 4/3),
        ])
    }
    
    func configureHeadlineLabel() {
        addSubview(headlineLabel)
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: timestampLabel.bottomAnchor, constant: K.newsCellPadding/2),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.newsCellPadding),
            headlineLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -K.newsCellPadding),
            headlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -K.newsCellPadding)
        ])
    }
    
    func configureTimestampLabel() {
        addSubview(timestampLabel)
        
        NSLayoutConstraint.activate([
            timestampLabel.topAnchor.constraint(equalTo: topAnchor, constant:   K.newsCellPadding),
            timestampLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.newsCellPadding),
            timestampLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -K.newsCellPadding),
            timestampLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func setNoImageConstraints() {
        NSLayoutConstraint.activate([
            timestampLabel.topAnchor.constraint(equalTo: topAnchor, constant:   K.newsCellPadding),
            timestampLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.newsCellPadding),
            timestampLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.newsCellPadding),
            timestampLabel.heightAnchor.constraint(equalToConstant: 16),
            
            headlineLabel.topAnchor.constraint(equalTo: timestampLabel.bottomAnchor, constant: K.newsCellPadding/2),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: K.newsCellPadding),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -K.newsCellPadding),
            headlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -K.newsCellPadding)
        ])
    }
}

