//
//  FavoriteView.swift
//  Moviesse
//
//  Created by Stevhen on 13/12/20.
//

import SwiftUI

struct FavoriteView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var movies: [MovieViewModel]
    
    var body: some View {
        
        MovieListView(movies: movies)
        
        .navigationBarTitle("Favorites", displayMode: .large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: leadingItem
        )
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
