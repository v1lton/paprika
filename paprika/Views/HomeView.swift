//
//  RootView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

import SwiftUI
struct HomeView: View {
    
    @State var recipes = [RecipeElement]()
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State var text = ""
    var body: some View {
        VStack{
            CustomSearchBar(text: $text)
            Spacer()
            ScrollView(.horizontal, showsIndicators: false){
                //LazyVGrid(columns: columns, spacing:20){
                    HStack(spacing: 16){
                        ForEach(recipes) { recipe in
                            if recipe.name == text{
                                Card(photo: Binding.constant(recipe.image),
                                     title: Binding.constant(recipe.name),
                                     tag: Binding.constant(recipe.lvl),
                                     favorited: Binding.constant(recipe.favorited))
                            }
                        }
                    }.padding(16)
                    .onAppear() {
                        AppDataService().getRecipes { (recipes) in
                            self.recipes = recipes
                        }
                    }

                //}
            }
        }
        
        ZStack {
            Color.primitive100
                .ignoresSafeArea()
            
            VStack{
                CardsScroll()
                CardsScroll()
                Spacer()
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

