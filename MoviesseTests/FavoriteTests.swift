//
//  FavoriteTests.swift
//  MoviesseTests
//
//  Created by Stevhen on 14/12/20.
//

import XCTest
@testable import Moviesse

class FavoriteTests: XCTestCase {

    var favorites = Favorites()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddToFavorite() throws {
        let movie = Movie(id: 0, title: "", overview: "", poster_path: "", release_date: "")
        let movieVM = MovieViewModel(movie: movie)
        
        favorites.add(movieVM)
        
        let result = favorites.contains(movieVM)
        
        XCTAssertEqual(result, true)
    }

    func testRemoveFavorite() throws {
        let movie = Movie(id: 0, title: "", overview: "", poster_path: "", release_date: "")
        let movieVM = MovieViewModel(movie: movie)
        
        favorites.remove(movieVM)
        
        let result = favorites.contains(movieVM)
        
        XCTAssertEqual(result, false)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
