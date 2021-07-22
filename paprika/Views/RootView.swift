//
//  RootView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

import SwiftUI

struct RootView: View {
    
    @State var recipes = [RecipeElement]()
    
    var body: some View {
        VStack {
            List(recipes) { recipe in
                NavigationLink(
                    destination: RecipeView(recipe: recipe),
                    label: {
                        Text("Ver receita \(recipe.name)")
                    }).navigationTitle("Início")
            }
    
        }.onAppear() {
            AppDataService().getRecipes { (recipes) in
                self.recipes = recipes
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

