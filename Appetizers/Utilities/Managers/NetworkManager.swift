//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mesum Syed on 28/05/2025.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static   let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private static let appetizerURL = baseURL + "appetizers"
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>)  -> Void){
        
        // url ?: return
        guard let url = URL(string: NetworkManager.appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            //error?.let{ has value return }
            if let _ = error  {
                completed(.failure(.unableToComplete))
                return
            }
                
            
            
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                 completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodeResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodeResponse.request))
                
            }catch{
                completed(.failure(.invalidData))
            }
            
        }
            task.resume()
            
        
    }
    
    func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void){
         
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else{
                 completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()

    }
    private init() {}

}
    

