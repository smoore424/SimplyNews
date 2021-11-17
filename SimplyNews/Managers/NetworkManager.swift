//
//  NetworkManager.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/11/21.
//

import UIKit

enum CategoryType: String {
    case business = "&category=business"
    case entertainment = "&category=entertainment"
    case general = "&category=general"
    case health = "&category=health"
    case science = "&category=science"
    case sports = "&category=sports"
    case technology = "&category=technology"
}
    
class NetworkManager {
    
    static let shared = NetworkManager()
    
    //what endpoint should look like with country and category: https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=f16bdbdfe2944f1f982591999133f53a
    private let baseURL = "https://newsapi.org/v2/top-headlines?"
    private let country = "country=us"
    //TODO: Protect APIKey before turning public on github
    private let apiKey = "&apiKey=f16bdbdfe2944f1f982591999133f53a"
    
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getNews(category: CategoryType, completed: @escaping (Result<SNResponse, SNError>) -> Void) {
        
        let endpoint = baseURL + country + category.rawValue + "&pageSize=100" + apiKey
        print(endpoint)
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.invalidResponse))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let sNResponse = try decoder.decode(SNResponse.self, from: data)
                completed(.success(sNResponse))

            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func searchNews(for keyword: String, completed: @escaping (Result<SNResponse, SNError>) -> Void) {
        let endpoint = baseURL + country + "&q=\(keyword)" + "&pageSize=100" + apiKey
        print(endpoint)
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.invalidResponse))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let sNResponse = try decoder.decode(SNResponse.self, from: data)
                completed(.success(sNResponse))

            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
