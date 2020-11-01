//
//  MyAnimeManager.swift
//  AnimeFinder
//
//  Created by Al Wesley Salac on 11/1/20.
//

// Model will utilize the API

// API token setup link:
// https://myanimelist.net/blog.php?eid=835707

// API doc link:
// https://myanimelist.net/apiconfig/references/api/v2

import Foundation

class MyAnimeManager {
    
    var delegate: MyAnimeManagerDelegate?
    
    func getList(with title: String) -> Void {
        if title == "" {
            return
        }
        
        let urlString = "https://api.myanimelist.net/v2/anime?q=\(title)&limit=2"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(kMyToken)", forHTTPHeaderField: "Authorization")
                
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Session Error:",error.localizedDescription)
                return
            }
            
            if let data = data {
                let list = self.parseJSON(data: data)
                self.delegate?.didUpdateList(list: list)
            }
        }
        
        task.resume()
    }
    
    func parseJSON(data: Data) -> AnimeList {
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(AnimeList.self, from: data)
        } catch {
            print("Decoder Error:",error.localizedDescription)
            return AnimeList(data: [])
        }
    }
}

protocol MyAnimeManagerDelegate {
    func didUpdateList(list: AnimeList)
}
