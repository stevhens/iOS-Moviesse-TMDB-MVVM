//
//  Review.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import Foundation

struct ReviewResponse: Decodable {
    let results: [Review]
}

struct Review: Decodable {
    let author: String
    let content: String
    let created_at: String
    let author_details: Author
}

struct Author: Decodable {
    let avatar_path: String?
    let rating: Int?
}
