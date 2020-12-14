//
//  ReviewRowView.swift
//  Moviesse
//
//  Created by Stevhen on 14/12/20.
//

import SwiftUI

struct ReviewRowView: View {
    let review: ReviewViewModel
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Color.white
                    
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        AsyncImage(
                            url: review.avatar,
                            placeholder: { Text("Loading ...") },
                            image: { Image(uiImage: $0).resizable() }
                        )
                        .clipShape(Circle())
                        .frame(width: 50, height: 50, alignment: .leading)
                        
                        VStack(alignment: .leading) {
                            Text(review.author)
                                .font(.system(size: 20))
                                .padding(.bottom, 3)
                                .lineLimit(1)
                            
                            Text(Utils.dateFormatterDateOrigin(review.createdAt))
                        }
                        
                        Spacer()
                        
                        Text("⭐️ \(review.rating) / 10")
                            .font(.system(size: 17))
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                                                
                        Text(review.content)
                            .font(.system(size: 17))
                            .lineLimit(nil)
                    }
                    .foregroundColor(.black)
                    .padding()
                }
            }
            .cornerRadius(8.0)
        }
    }
}
