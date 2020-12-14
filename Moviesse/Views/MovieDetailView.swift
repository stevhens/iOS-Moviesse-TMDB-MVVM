//
//  MovieDetailView.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var favorites: Favorites
    
    @ObservedObject private var reviewListVM = ReviewListViewModel()
    
    let movie: MovieViewModel
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.05)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    AsyncImage(
                        url: movie.posterUrl,
                        placeholder: { Text("Loading ...") },
                        image: { Image(uiImage: $0).resizable() }
                    )
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height / 2.5,
                        alignment: .leading
                    )
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(movie.title)
                                    .font(.system(size: 20))
                                    .bold()
                                    .lineLimit(nil)
                                
                                Spacer()
                                
                                favouriteButton
                            }
                            
                            Text(Utils.dateFormatter(movie.releaseDate))
                        }
                        
                        VStack(alignment: .leading, spacing: 15) {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Overview")
                                    .font(.title3)
                                    .bold()
                                
                                Text(movie.overview)
                                    .font(.system(size: 17))
                                    .lineLimit(nil)
                            }
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Reviews")
                                    .font(.title3)
                                    .bold()
                                
                                ReviewListView(reviews: reviewListVM.reviews)
                            }
                        }
                        
                    }
                    .foregroundColor(.black)
                    .padding()
                    
                    Spacer()
                }
                .onAppear {
                    self.reviewListVM.getReviewData(movieID: movie.movieID)
                }
                .navigationBarTitle(movie.title, displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading: leadingItem
                )
            }
        }
    }
    
    var favouriteButton: some View {
        Button(action: {
            self.favorites.contains(self.movie) ? self.favorites.remove(self.movie) : self.favorites.add(self.movie)
        }, label: {
            Image(systemName: favorites.contains(movie) ? "heart.fill" : "heart")
                .font(.title2)
                .foregroundColor(.red)
        })
    }
    
    var leadingItem: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        })
    }
}
