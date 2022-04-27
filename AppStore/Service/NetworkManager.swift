//
//  NetworkManager.swift
//  AppStore
//
//  Created by Nii Yemoh on 23/04/2022.
//

import Foundation



class NetworkManager {
    
    
    static let shared = NetworkManager()
    
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResultResponse?, Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        makeRequest(urlString: urlString, completion: completion)
    }
    
    
    
    func fetchTopFree(completion: @escaping (AppGroup?, Error?) -> ()){
        
        fetchAppGroups(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json",
                       completion: completion)
        
    }
    
    

    
    func fetchTopPaid(completion: @escaping (AppGroup?, Error?) -> ()){
        
        fetchAppGroups(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json",
                       completion: completion)
        
    }
    
    
    
    
    func fetchAppGroups(urlString: String, completion: @escaping (AppGroup?, Error?) -> ()){
        makeRequest(urlString: urlString, completion: completion)
    }
    
    
    
    
    func fetchSocialApps(completion: @escaping ([Social]?, Error?) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        makeRequest(urlString: urlString, completion: completion)
    }
    
    
    
    

    
    func makeRequest<T: Decodable>(urlString: String, completion: @escaping (T?,Error?) -> ()){
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url, completionHandler:  { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil,error)
                return
            }
            
            
            do{
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(json, nil)
            }catch {
                completion(nil, error)
                return
            }
            
        }).resume()
    }
    
    
    
}
