//
//  CardsScroll.swift
//  paprika
//
//  Created by iris on 22/07/21.
//

import SwiftUI

struct CardsScroll: View {
    @State var recipes = [RecipeElement]()
    
    var body: some View {
        ZStack {
            Color.primitive100
                .ignoresSafeArea()
            
            ScrollView(.horizontal) {
                HStack(spacing: 16){
                    ForEach(recipes) { recipe in
                        Card(photo: Binding.constant(recipe.image),
                             title: Binding.constant(recipe.name),
                             tag: Binding.constant(recipe.lvl),
                             favorited: Binding.constant(recipe.favorited))
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
}
struct CardsScroll_Previews: PreviewProvider {
    static var previews: some View {
        CardsScroll()
    }
}
