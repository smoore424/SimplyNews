//
//  ViewController.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/3/21.
//

import UIKit

class MainViewController: UIViewController {
    
    var newsItems: [Article] = []

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        //register cell
        tableView.register(NewsCell.self, forCellReuseIdentifier: K.newsCell)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        newsItems = dummyData()
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
    func setNavigationUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Simply News"
    }
}

extension MainViewController {
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
        let vc = ArticleViewController()
        vc.article = newsItems[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: DUMMY DATA - DELETE ONCE READY TO MAKE NETWORK CALL
extension MainViewController {
    func dummyData() -> [News]{
        let news1 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test - 123456 hello!", timeStamp: "CNN • 4hrs ago • Mr. Rogers")
        let news2 = News(image: UIImage(named: "dummy")!, headline: "Inside the fight over America's biggest and most extravagant new mansion.", timeStamp: "Spokesman Review • 4hrs ago • Really Long Author Name")
        let news3 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test", timeStamp: "4hrs ago • Mr. Rogers")
        let news4 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test", timeStamp: "4hrs ago • Mr. Rogers")
        let news5 = News(image: UIImage(named: "dummy")!, headline: "David Amess stabbing leaves U.K. lawmakers reeling from latest attack - NBC News", timeStamp: "4hrs ago • Mr. Rogers")
        let news6 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test", timeStamp: "4hrs ago • Mr. Rogers")
        let news7 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test", timeStamp: "4hrs ago • Mr. Rogers")
        let news8 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test", timeStamp: "4hrs ago • Mr. Rogers")
        let news9 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test", timeStamp: "4hrs ago • Mr. Rogers")
        let news10 = News(image: UIImage(named: "dummy")!, headline: "Testing - this is a test", timeStamp: "4hrs ago • Mr. Rogers")
        
        return [news1, news2, news3, news4, news5, news6, news7, news8, news9, news10]
    }
}
