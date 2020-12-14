//
//  ReviewListView.swift
//  Moviesse
//
//  Created by Stevhen on 14/12/20.
//

import SwiftUI

struct ReviewListView: View {
    let reviews: [ReviewViewModel]
    
    var body: some View {
        
        if reviews.isEmpty {
            Text("There are no reviews yet")
                .padding()
        } else {
            ScrollView {
                
                ForEach(reviews, id: \.id) { review in
                    
                    ReviewRowView(review: review)
                    
                }
            }
            
        }
    }
}
