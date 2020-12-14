//
//  MovieListView.swift
//  Moviesse
//
//  Created by Stevhen on 14/12/20.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]
    
    var body: some View {
        
        if movies.isEmpty {
            Text("There are no movies yet")
                .padding()
        } else {
            ScrollView {
                
                ForEach(movies, id: \.id) { movie in
                    
                    NavigationLink(
                        destination: MovieDetailView(movie: movie),
                        label: {
                            MovieRowView(movie: movie)
                        }
                    )
                    
                }
                .padding()
            }
        }
        
    }
}
