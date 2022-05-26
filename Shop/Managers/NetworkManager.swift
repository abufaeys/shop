//
//  NetworkManager.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import UIKit

/// An environment singleton responsible for fetching data from the api, and for downloading and caching images.
final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    private let `default` = baseURL + "default/dynamodb-writer"
    
    private init() {}
        
    /// Retrieves data from the api.
    ///
    /// If we succeeded, we will return the data. If we fail, we will show an alert detailing what went wrong.
    ///
    /// - Parameter completed: Whether or not we succeeded in fetching data from the api.
    func getShop(completed: @escaping (Result<[Item], ShopError>) -> Void) {
        
        guard let url = URL(string: `default`) else {
            
            completed(.failure(.invalidURL))
            return
            
        }
        
        /// Fetches the data from the api if we succeed, otherwise we show an alert detailing what went wrong.
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ = error {
                
                completed(.failure(.unableToComplete))
                return
                
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
                let decodedResponse = try decoder.decode(Shop.self, from: data)
                completed(.success(decodedResponse.results))
                
            } catch {
                
                completed(.failure(.invalidData))
                return
                
            }
            
        }
        
        task.resume()
        
    }
        
    /// Downloads and caches an image from the api
    /// - Parameters:
    ///   - urlString: The url of the api where we get our data from.
    ///   - completed: Whether or not we succeeded from downloading an image from the api.
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            
            completed(image)
            return
            
        }
        
        guard let url = URL(string: urlString) else {
            
            completed(nil)
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                
                completed(nil)
                return
                
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        
        task.resume()
        
    }
    
}
