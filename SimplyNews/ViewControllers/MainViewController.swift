//
//  ViewController.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/3/21.
//

import SafariServices
import UIKit

class MainViewController: UIViewController {
    
    var newsItems: [Article] = []

    var collectionViewContentView: UIView!
    var collectionView: UICollectionView!
    
    var tableViewContentView: UIView!
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 116
        //register cell
        tableView.register(NewsCell.self, forCellReuseIdentifier: K.newsCell)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewUI()
        setNavigationUI()
        setTableViewUI()
        getNews()
    }
    
    
    func getNews() {
        NetworkManager.shared.getTopUSNews { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.newsItems = response.articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            //TODO: handle error
            case .failure(let error):
                print(error)
            }
        }
    }
    
}


extension MainViewController {
    
    private func setNavigationUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Simply News"
    }
    
    
    private func setCollectionViewUI() {
        let padding: CGFloat = 10
        collectionViewContentView = UIView(frame: .zero)
        view.addSubview(collectionViewContentView)
        collectionViewContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionViewContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionViewContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionViewContentView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
//        layout.minimumInteritemSpacing = 4
        layout.itemSize = CGSize(width: 120, height: 100)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseID)
//        collectionView.pin(to: collectionViewContentView)
        
        collectionViewContentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
  
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: collectionViewContentView.topAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: collectionViewContentView.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: collectionViewContentView.trailingAnchor, constant: -padding),
            collectionView.bottomAnchor.constraint(equalTo: collectionViewContentView.bottomAnchor, constant: -padding)
        ])

    }
    
    
    private func setTableViewUI() {
        tableViewContentView = UIView(frame: .zero)
        view.addSubview(tableViewContentView)
        tableViewContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableViewContentView.topAnchor.constraint(equalTo: collectionViewContentView.bottomAnchor),
            tableViewContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableViewContentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.pin(to: tableViewContentView)
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseID, for: indexPath) as! CategoryCell

        cell.setCells(for: indexPath.item)
        return cell
    }
    
    
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newsCell) as! NewsCell
        let newsItem = newsItems[indexPath.row]
        cell.set(newsItem: newsItem)
        return cell
    }
}


extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let url = newsItems[indexPath.row].url
        
        if let url = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            vc.delegate = self
    
            present(vc, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension MainViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}


extension MainViewController: UICollectionViewDelegate {
    
}
