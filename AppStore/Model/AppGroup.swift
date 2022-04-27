//
//  Feed.swift
//  AppStore
//
//  Created by Nii Yemoh on 27/04/2022.
//

import Foundation


struct AppGroup: Decodable {
    let feed: Feed
}



struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}


struct FeedResult: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}
