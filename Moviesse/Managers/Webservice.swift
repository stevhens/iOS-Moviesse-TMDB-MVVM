//
//  Webservice.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import Foundation

enum Category: String, CaseIterable {
    case popular = "Popular"
    case topRated = "Top Rated"
    case nowPlaying = "Now Playing"
    case upcoming = "Upcoming"
}

class Webservice {
    
    func loadMovies(urlCategory: Category, completion: @escaping ([Movie]?) -> Void) {
        
        var urlStr = ""
        let apiKey = "?api_key=\(K.ApiKey)"
        
        if urlCategory == .popular {
            urlStr = "https://api.themoviedb.org/3/movie/popular"
        } else if urlCategory == .topRated {
            urlStr = "https://api.themoviedb.org/3/movie/top_rated"
        } else if urlCategory == .nowPlaying {
            urlStr = "https://api.themoviedb.org/3/movie/now_playing"
        } else if urlCategory == .upcoming {
            urlStr = "https://api.themoviedb.org/3/movie/upcoming"
        }
        
        guard let url = URL(string: urlStr + apiKey) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(nil)
            }
            
            let moviesList = try? JSONDecoder().decode(MoviesResponse.self, from: data)
            completion(moviesList?.results)
            
        }.resume()
        
    }
    
    func loadReviews(movieID: Int, completion: @escaping ([Review]?) -> Void) {
        
        let urlStr = "https://api.themoviedb.org/3/movie/\(movieID)/reviews"
        let apiKey = "?api_key=\(K.ApiKey)"
        
        guard let url = URL(string: urlStr + apiKey) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(nil)
            }
            
            let reviewsList = try? JSONDecoder().decode(ReviewResponse.self, from: data)
            completion(reviewsList?.results)
            
        }.resume()
        
    }
}
