//
//  MovieViewModel.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import Foundation

class MovieViewModel {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    let id: UUID = UUID()
    
    var movieID: Int {
        return self.movie.id
    }
    
    var title: String {
        return self.movie.title
    }
    
    var overview: String {
        return self.movie.overview
    }
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500" + (self.movie.poster_path ?? "")) ?? URL(string: "https://www.tibs.org.tw/images/default.jpg")!
    }
    
    var releaseDate: String {
        return self.movie.release_date
    }
}
