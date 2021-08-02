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
    @State public var isEditing = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                CustomSearchBar(isEditing: Binding.constant(isEditing), text: $text)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false){
                    //LazyVGrid(columns: columns, spacing:20){
                        HStack(spacing: 16){
                            if isEditing == true{
                                Text("Resultados da busca")
                                    .font(.custom("SF Pro Display Bold", size: 24))
                                    .lineLimit(2)
                                    .foregroundColor(.primitiveBlack)
                                Spacer()
                            }
                            ForEach(recipes) { recipe in
                                if recipe.name.localizedCaseInsensitiveContains(text) && (text.count > 2){
                                    Card(photo: Binding.constant(recipe.image),
                                         title: Binding.constant(recipe.name),
                                         tag: Binding.constant(recipe.lvl))
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
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

