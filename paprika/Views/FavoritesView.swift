//
//  FavoritesView.swift
//  paprika
//
//  Created by iris on 05/08/21.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var favorites = Favorites()
    
    let recipes: [RecipeElement]
    let gridItemLayout = [GridItem(.adaptive(minimum: 255, maximum: 255))]

    var body: some View {
        ZStack {
            
            Color.primitive50
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Favoritos")
                        .font(.custom("Albra Semi", size: 56))
                        .foregroundColor(Color.primitiveBlack)
                    Spacer()
                }
                Spacer()
                    .frame(height: 32)
                
                if (self.favorites.get()) == 0 {
                    VStack{
                        EmptyView()
                        Spacer()
                    }
                }

                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: gridItemLayout, alignment: .leading) {
                        ForEach(recipes) { recipe in
                            if self.favorites.contains(recipe){
                                NavigationLink(
                                    destination: RecipeView(recipe: recipe),
                                    label: {
                                        Card(recipe: Binding.constant(recipe), favorites: favorites)
                                            .padding(.bottom, 10)
                                    }).buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }.padding(.horizontal, 16)
        }.navigationBarTitle("", displayMode: .inline)
    }
}
