//
//  SearchResultsViewController.swift
//  SimplyNews
//
//  Created by Stacey Moore on 11/16/21.
//

import SafariServices
import UIKit

class SearchResultsViewController: SNDataViewController {
    
    var searchResults: [Article] = []
    
    let searchBar = UISearchBar()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearch()
        view.backgroundColor = .red
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 116
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(NewsCell.self, forCellReuseIdentifier: K.newsCell)
    }
    
    
    func configureSearch() {
        navigationItem.setHidesBackButton(true, animated: false)
        searchBar.sizeToFit()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Search for news"
        searchBar.becomeFirstResponder()
    }
    
    
    func searchNews(for text: String) {
        NetworkManager.shared.searchNews(for: text) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.searchResults.append(contentsOf: response.articles)
                
                if self.searchResults.isEmpty {
                    let message = "Sorry, no stories found for the search term \"\(text)\". \nPlease try another search term"
                    DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            //TODO: Handle Error
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newsCell) as! NewsCell
        let newsItem = searchResults[indexPath.row]
        cell.set(newsItem: newsItem)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let url = searchResults[indexPath.row].url
        
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
extension SearchResultsViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}


extension SearchResultsViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel clicked")
        navigationController?.popViewController(animated: true)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search Now")
        searchResults = []
        //perform network call based on search input
        guard let text = searchBar.text, !text.isEmpty else { return }
        searchNews(for: text)
    }
}


