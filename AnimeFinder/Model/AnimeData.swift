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

struct AnimeGenres {
    enum Genres: Int, CaseIterable {
        case Action = 1
        case Adventure
        case Cars
        case Comedy
        case Dementia
        case Demons
        case Mystery
        case Drama
        case Ecchi
        case Fantasy
        case Game
        case Hentai
        case Historical
        case Horror
        case Kids
        case Magic
        case Martial_Arts
        case Mecha
        case Music
        case Parody
        case Samurai
        case Romance
        case School
        case Sci_Fi
        case Shoujo
        case Shoujo_Ai
        case Shounen
        case Shounen_Ai
        case Space
        case Sports
        case Super_Power
        case Vampire
        case Yaoi
        case Yuri
        case Harem
        case Slice_Of_Life
        case Supernatural
        case Military
        case Police
        case Psychological
        case Thriller
        case Seinen
        case Josei
        
    }
}
