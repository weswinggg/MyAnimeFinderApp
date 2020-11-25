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
import Alamofire

struct MyAnimeManager {
        
    func searchTitle(with title: String, completion: @escaping ([AnimeSearch.Result]) -> ()) {
        var urlString = "https://api.jikan.moe/v3/search/anime?q=\(title)&limit=10"
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(urlString)
            .validate()
            .responseDecodable(of: AnimeSearch.self) { res in
                guard let data = res.value else { return }
                completion(data.results)
            }
    }
    
    func getImage(with urlString: String) -> UIImage {
        var imageView = UIImage()
        
        if let url = URL(string: urlString) {
            do {
                let data = try Data(contentsOf: url)
                if let image  = UIImage(data: data) {
                    imageView = image
                }
            } catch  {
                print(error.localizedDescription)
            }
        }
        
        return imageView
    }
    
    func getGenres() -> [String] {

        var genres = [String]()
        AnimeGenres.Genres.allCases.forEach {
            genres.append("\($0)")
        }
        
        return genres
    }
}
