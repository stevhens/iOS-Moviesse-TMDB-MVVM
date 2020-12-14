//
//  Movie.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let release_date: String
}
