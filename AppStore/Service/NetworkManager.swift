//
//  NetworkManager.swift
//  AppStore
//
//  Created by Nii Yemoh on 23/04/2022.
//

import Foundation



class NetworkManager {
    
    
    static let shared = NetworkManager()
    
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error { print("failed to fetch apps data:", error); return}
            guard let data = data else { completion([], error); return }
            
            do {
                let json = try  JSONDecoder().decode(SearchResultResponse.self, from: data)
                completion(json.results, nil)
            }catch {
                print("Error decoding JSON:",error)
                completion([], error)
            }
        }.resume()
    }
    
    
    
    
    
}
