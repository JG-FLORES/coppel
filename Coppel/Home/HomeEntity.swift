//
//  HomeEntity.swift
//  Coppel
//
//  Created by JG on 07/03/23.
//

import Foundation

// MARK: Movies struct
struct Movies: Codable {
    let page: Int?
    var results: [Movie]
    
    enum Codingkeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: Movie struct
struct Movie: Codable {
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var release_date: String?
    var title: String?
    var vote_average: Double?
    var first_air_date: String?
    var name: String?
    var backdrop_path: String?
    var poster_path: String?
    var adult: Bool?
}
