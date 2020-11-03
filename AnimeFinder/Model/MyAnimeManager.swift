//
//  MyAnimeManager.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/1/20.
//

// Model will utilize the API

// New MyAnimeList API / Jikan
// https://jikan.docs.apiary.io/#

import UIKit

class MyAnimeManager {
    
    var delegate: MyAnimeManagerDelegate?
    
    func searchTitle(with title: String) {
        if title == "" {
            return
        }
        
        var urlString = "https://api.jikan.moe/v3/search/anime?q=\(title)&limit=10"
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
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
    
    func getImage(with urlString: String) -> UIImage {
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        let imageView = UIImage(data: data!)
        return imageView!
    }
    
    func getGenres() -> [String] {

        var genres = [String]()
        AnimeGenres.Genres.allCases.forEach {
            genres.append("\($0)")
        }
        
        return genres
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
