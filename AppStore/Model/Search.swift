//
//  Search.swift
//  AppStore
//
//  Created by Nii Yemoh on 23/04/2022.
//

import Foundation


struct SearchResultResponse: Decodable {
    let resultCount: Int
    let results: [Result]
}


struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
}
