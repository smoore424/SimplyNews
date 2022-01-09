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

    private let baseURL = "https://newsapi.org/v2/"
    private let topHeadlines = "top-headlines?"
    private let everything = "everything?"
    private let country = "country=us"
    
    private let mostRecent = "&sortBy=publishedAt"
    private let english = "&language=en"
    private let api = "&apiKey="
 
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func fetchNews(category: CategoryType, completed: @escaping (Result<SNResponse, SNError>) -> Void) {
        
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            print("Can't find API Key")
            return }
        
        let endpoint = baseURL + topHeadlines + country + category.rawValue + "&pageSize=100" + api + apiKey
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
        
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else { return }
        
        let endpoint = baseURL + everything + "q=\(keyword)" + "&pageSize=100" + english + mostRecent + api + apiKey
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
