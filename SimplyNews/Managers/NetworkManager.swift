//
//  NetworkManager.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/11/21.
//

import Foundation
    
class NetworkManager {
    
    static let shared = NetworkManager()
    
    let baseURL = "https://newsapi.org/v2/top-headlines?"
    let country = "country=us"
    //TODO: Protect APIKey before turning public on github
    let apiKey = "&apiKey=f16bdbdfe2944f1f982591999133f53a"
    
    private init() {}
    
    func getTopUSNews(completed: @escaping (Result<SNResponse, SNError>) -> Void) {
        
        let endpoint = baseURL + country + apiKey
        
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
