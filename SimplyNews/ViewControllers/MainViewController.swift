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
    var selectedCategory: CategoryType = .general
    var selectedIndexPath: IndexPath = [0, 0]

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
        getNews(category: selectedCategory)
    }
    
    
    func getNews(category: CategoryType) {
        NetworkManager.shared.fetchNews(category: category) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.newsItems.append(contentsOf: response.articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            //TODO: handle error
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @objc func showSearchResultsVC() {
        let searchResultsVC = SearchResultsViewController()
        navigationController?.pushViewController(searchResultsVC, animated: true)
    }
}


//MARK: - UI Configuration
extension MainViewController {
    
    private func setNavigationUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Simply News"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchResultsVC))
    }
    
    
    private func setCollectionViewUI() {
        let padding: CGFloat = 5
        
        collectionViewContentView = UIView(frame: .zero)
        collectionViewContentView.backgroundColor = .systemBackground
        view.addSubview(collectionViewContentView)
        collectionViewContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionViewContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionViewContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionViewContentView.heightAnchor.constraint(equalToConstant: 85)
        ])
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        layout.itemSize = CGSize(width: 240, height: 60)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseID)
        
        collectionView.backgroundColor = .systemBackground
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


//MARK: - UICollectionView
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseID, for: indexPath) as! CategoryCell

        if indexPath == selectedIndexPath {
            cell.setCells(for: indexPath.item, selected: true)
        } else {
            cell.setCells(for: indexPath.item, selected: false)
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            selectedIndexPath = indexPath
            collectionView.reloadData()
            
            let catID = cell.getCategoryID(for: indexPath.item)
            selectedCategory = catID
            newsItems.removeAll()
            getNews(category: selectedCategory)
        }
    }
}


//MARK: - UITableView
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newsCell) as! NewsCell
        let newsItem = newsItems[indexPath.row]
        if newsItem.urlToImage != nil {
            cell.set(newsItem: newsItem, withImage: true)
        } else {
            cell.set(newsItem: newsItem, withImage: false)
        }
        return cell
    }
  
    
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


//MARK: - SFSafariViewController
extension MainViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}

/*
 Unable to support pagination at this time due to free API limitations.
 Only allows for a total of 100 responses in a free account
 To perserve API calls, best to try and get 100 upfront.
 */
//extension MainViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let position = scrollView.contentOffset.y
//        let contentHeight = tableView.contentSize.height - 100
//        let height = scrollView.frame.size.height
//
//        if position > contentHeight - height {
//            guard hasMoreNews else { return }
//            page += 1
//            getNews(category: selectedCategory)
//        }
//    }
//}
