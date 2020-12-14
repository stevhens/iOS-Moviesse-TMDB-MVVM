//
//  ReviewViewModel.swift
//  Moviesse
//
//  Created by Stevhen on 14/12/20.
//

import Foundation

class ReviewViewModel {
    
    var review: Review
    
    init(review: Review) {
        self.review = review
    }
    
    let id: UUID = UUID()
    
    var author: String {
        return self.review.author
    }
    
    var content: String {
        return self.review.content
    }
    
    var createdAt: String {
        return self.review.created_at
    }
    
    var avatar: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500" + (self.review.author_details.avatar_path ?? "")) ?? URL(string: "https://www.tibs.org.tw/images/default.jpg")!
    }
    
    var rating: Int {
        return self.review.author_details.rating ?? -1
    }
}
