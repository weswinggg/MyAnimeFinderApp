//
//  MyAnimeManager.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/1/20.
//

// Model will utilize the API

// New MyAnimeList API / Jikan
// https://jikan.docs.apiary.io/#

import Foundation

class MyAnimeManager {
    
    var delegate: MyAnimeManagerDelegate?
    
    func getList(with title: String) {
        if title == "" {
            return
        }
        
        let urlString = "https://api.jikan.moe/v3/search/anime?q=\(title)&limit=10"
        let url = URL(string: urlString)!

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Session Error:",error.localizedDescription)
                return
            }
            
            if let data = data {
                let list: AnimeSearch = self.parseJSON(data: data)
                self.delegate?.didSearchComplete(with: list)
            }
        }
        
        task.resume()
    }
    
    func parseJSON<T: Decodable>(data: Data) -> T{
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data")
        }
        
        return decoded
    }
}

protocol MyAnimeManagerDelegate {
    func didSearchComplete(with data: AnimeSearch)
}
