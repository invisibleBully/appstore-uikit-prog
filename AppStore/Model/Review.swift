//
//  Review.swift
//  AppStore
//
//  Created by Nii Yemoh on 05/05/2022.
//

import Foundation



struct Review: Decodable {
    let feed: ReviewFeed
}



struct ReviewFeed: Decodable {
    let entry: [Entry]
}


struct Entry: Decodable {
    
    let author: Author
    let title: Label
    let content: Label
    let rating: Label
    
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
    
    
}



struct Label: Decodable {
    let label: String
}



struct Author: Decodable {
    let name: Label
}



