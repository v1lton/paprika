//
//  CardsScroll.swift
//  paprika
//
//  Created by iris on 22/07/21.
//

import SwiftUI

struct CardsScroll: View {
    @State var recipes = [RecipeElement]()
    @StateObject var favorites = Favorites()
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack(spacing: 16){
                ForEach(recipes) { recipe in

                    NavigationLink(
                        destination: RecipeView(recipe: recipe),
                        label: {
                            Card(recipe: Binding.constant(recipe), favorites: favorites)
                        }).navigationTitle("Início")
                }
            }.padding(16)
            .onAppear() {
                AppDataService().getRecipes { (recipes) in
                    self.recipes = recipes
                
                }
            }
        }
    }
}
struct CardsScroll_Previews: PreviewProvider {
    static var previews: some View {
        CardsScroll()
    }
}
