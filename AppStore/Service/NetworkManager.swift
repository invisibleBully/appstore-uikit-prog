//
//  NetworkManager.swift
//  AppStore
//
//  Created by Nii Yemoh on 23/04/2022.
//

import Foundation



class NetworkManager {
    
    
    static let shared = NetworkManager()
    
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
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
    
    
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()){
        
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
        
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(json, nil)
            }catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    
    
    
    
}
