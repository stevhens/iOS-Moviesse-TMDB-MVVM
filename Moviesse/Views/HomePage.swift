//
//  HomePage.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import SwiftUI

struct HomePage: View {
    
    @ObservedObject private var movieListVM = MovieListViewModel()
    @State var category: Category = .popular
    @ObservedObject var favorites = Favorites()
    
    @State var expandCategory: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    
                    Color.gray.opacity(0.05)
                        .edgesIgnoringSafeArea(.all)
                    
                    MovieListView(movies: movieListVM.movies)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            VStack {
                                
                                if self.expandCategory {
                                    ForEach(Category.allCases, id: \.self) { category in
                                        Button(action: {
                                            self.expandCategory.toggle()
                                            self.category = category
                                            self.movieListVM.getMovieData(urlCategory: category)
                                        }, label: {
                                            Text(category.rawValue)
                                        })
                                        .padding()
                                        .frame(width: 150, height: 50)
                                        .background(Color.gray)
                                        .foregroundColor(self.category == category ? Color.black.opacity(0.5) : .white)
                                        .disabled(self.category == category)
                                        
                                    }
                                    .cornerRadius(8)
                                    
                                }
                                
                                expandCategoryButton
                                
                            }
                            .animation(.spring())
                            .padding(.trailing, 30)
                            
                        }
                        .padding(.leading, 30)
                    }
                }
            }
            
            .navigationBarTitle("Moviesse", displayMode: .inline)
            .navigationBarItems(trailing: trailingItem)
        }
        .environmentObject(favorites)
        .onAppear {
            self.movieListVM.getMovieData(urlCategory: category)
        }
    }
    
    var expandCategoryButton: some View {
        Button(action: {
            self.expandCategory.toggle()
        }, label: {
            Image(systemName: "line.horizontal.3.decrease.circle.fill")
                .font(.title)
                .foregroundColor(.white)
                .padding(20)
        })
        .background(Color.gray)
        .clipShape(Circle())
        .rotationEffect(.init(degrees: self.expandCategory ? 180 : 0))
    }
    
    var trailingItem: some View {
        NavigationLink(
            destination: FavoriteView(movies: self.getFavorites()),
            label: {
                Image(systemName: "heart.fill")
                    .font(.title2)
                    .foregroundColor(.red)
            }
        )
    }
}

// MARK: - Actions
extension HomePage {
    @ViewBuilder
    func categoryButton(category: Category) -> some View {
        HStack {
            Button {
                self.movieListVM.getMovieData(urlCategory: category)
                expandCategory.toggle()
            } label: {
                Text(category.rawValue)
                    .foregroundColor(.black)
            }
            
            Spacer()
        }
        .padding()
    }
    
    func getFavorites() -> [MovieViewModel] {
        var myFavorites : [MovieViewModel] = []
        
        for movie in movieListVM.movies {
            if favorites.contains(movie) {
                myFavorites.append(movie)
            }
        }
        
        return myFavorites
    }
}
