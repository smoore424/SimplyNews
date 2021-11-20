//
//  SearchResultsViewController.swift
//  SimplyNews
//
//  Created by Stacey Moore on 11/16/21.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
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
        searchBar.becomeFirstResponder()
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
}


extension SearchResultsViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel clicked")
        navigationController?.popViewController(animated: true)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //perform network call based on search input
    }
}


