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
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}


extension MainViewController {
    private func setNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Simply News"
    }
    
    
    private func setTableViewUI() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.pin(to: view)
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
