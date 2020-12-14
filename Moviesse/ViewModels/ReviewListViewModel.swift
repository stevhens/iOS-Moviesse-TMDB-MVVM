//
//  ReviewListViewModel.swift
//  Moviesse
//
//  Created by Stevhen on 14/12/20.
//

import Foundation

class ReviewListViewModel: ObservableObject {
    
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewData(movieID: Int) {
        Webservice().loadReviews(movieID: movieID) { reviewList in
            if let reviewList = reviewList {
                DispatchQueue.main.async {
                    self.reviews = reviewList.map(ReviewViewModel.init)
                }
            }
        }
    }
}
