//
//  MovieListViewModel.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import Foundation

class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    func getMovieData(urlCategory: Category) {
        Webservice().loadMovies(urlCategory: urlCategory) { movieList in
            if let movieList = movieList {
                DispatchQueue.main.async {
                    self.movies = movieList.map(MovieViewModel.init)
                }
            }
        }
    }
}
