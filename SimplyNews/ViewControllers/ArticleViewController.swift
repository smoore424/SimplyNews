//
//  NewsArticleViewController.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/6/21.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var article: News?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let newsImageView = SNNewsImageView(cornerRadius: 0)
    let headlineLabel = SNHeadlineLabel(textAlignment: .left)
    let timestampLabel = SNTimestampLabel(textAlignment: .left)
    let sourceLabel = UILabel()
    let contentLabel = SNContentLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Read Article"
        
        newsImageView.image = UIImage(named: "dummy")
        headlineLabel.text = "TESTING! TESTING! TESTING! 123456 TESTING! TESTING! TESTING! 123456 TESTING! TESTING! TESTING! 123456"
        timestampLabel.text = article?.timeStamp
        sourceLabel.text = "Hellow, amm I here"
        contentLabel.text = """
        
        What is Lorem Ipsum?
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

        Why do we use it?
        It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


        Where does it come from?
        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanie"
        
        THE END
        """

        setConstraints()
    }
    
    private func setConstraints() {
        //scrollView
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
          scrollView.topAnchor.constraint(equalTo: view.topAnchor),
          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        //contentView
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
          contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
          contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
          contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
          contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
          contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        //newsImageView
        contentView.addSubview(newsImageView)
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 225),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 16/9)
        ])
        //headlineLabel
        contentView.addSubview(headlineLabel)
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: K.articlePadding),
            headlineLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: K.articlePadding),
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -K.articlePadding),
        ])
        
        //timeStampLabel
        contentView.addSubview(timestampLabel)
        
        NSLayoutConstraint.activate([
            timestampLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: K.articlePadding),
            timestampLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: K.articlePadding),
            timestampLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -K.articlePadding),
        ])
        
        //sourceLabel
        contentView.addSubview(sourceLabel)
        
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sourceLabel.topAnchor.constraint(equalTo: timestampLabel.bottomAnchor, constant: K.articlePadding),
            sourceLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: K.articlePadding),
            sourceLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -K.articlePadding),
        ])
        
        //contentLabel
        contentView.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: K.articlePadding),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: K.articlePadding),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -K.articlePadding),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
