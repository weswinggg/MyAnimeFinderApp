//
//  AnimeData.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/1/20.
//

import Foundation

struct AnimeSearch: Decodable {
    struct Result: Decodable {
        let mal_id: Int
        let title: String
        let image_url: String
        let url: String
        
        let type: String
        let airing: Bool
        
        let synopsis: String
        
        let episodes: Int
        let score: Double
        let rated: String
        
    }
    
    let results: [Result]
}
