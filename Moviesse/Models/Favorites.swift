//
//  Favorites.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import Foundation

class Favorites: ObservableObject {
    private var movies: Set<Int>

    private let saveKey = "Favorites"

    init() {
        let arr = UserDefaults.standard.array(forKey: saveKey)  as? [Int] ?? [Int]()
        self.movies = Set(arr.map { $0 })
    }

    func contains(_ movie: MovieViewModel) -> Bool {
        movies.contains(movie.movieID)
    }
    
    func add(_ movie: MovieViewModel) {
        objectWillChange.send()
        movies.insert(movie.movieID)
        save()
    }

    func remove(_ movie: MovieViewModel) {
        objectWillChange.send()
        movies.remove(movie.movieID)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(movies), forKey: saveKey)
    }
}
