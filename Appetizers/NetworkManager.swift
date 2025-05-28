//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mesum Syed on 28/05/2025.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
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
    private init() {}

}
    

