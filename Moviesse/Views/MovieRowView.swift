//
//  MovieRowView.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import SwiftUI

struct MovieRowView: View {
    let movie: MovieViewModel
    
    var body: some View {
        
        HStack {
            ZStack(alignment: .leading) {
                Color.white
                
                HStack(alignment: .top, spacing: 0) {
                    
                    AsyncImage(
                        url: movie.posterUrl,
                        placeholder: { Text("Loading ...") },
                        image: { Image(uiImage: $0).resizable() }
                    )
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.5, alignment: .leading)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(movie.title)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom, 3)
                            .lineLimit(0)
                        
                        Text(Utils.dateFormatter(movie.releaseDate))
                        
                        Text(movie.overview)
                            .font(.system(size: 17))
                            .lineLimit(3)
                    }
                    .foregroundColor(.black)
                    .padding()
                    
                }
            }
            .cornerRadius(8.0)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2)
        }
        .shadow(radius: 5)
        .padding()
    }
}
