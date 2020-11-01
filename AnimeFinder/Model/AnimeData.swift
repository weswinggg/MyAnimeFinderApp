//
//  AnimeData.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/1/20.
//

import Foundation

struct AnimeList: Decodable {
    struct Data: Decodable {
        let node: Node
    }
    
    struct Node: Decodable {
        let id: Int
        let title: String
        let main_picture: MainPicture
    }
    
    struct MainPicture: Decodable {
        let medium: String
        let large: String
    }
    
    let data: [Data]
}
