//
//  RootView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

// TODO: Retirar o título Início

import SwiftUI

struct HomeView: View {
    
    @State var recipes = [RecipeElement]()
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State var text = ""
    @State public var isEditing = false
    
    var body: some View {
        ZStack {
            Color.primitive50
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    VStack{
                        
                        CustomSearchBar(isEditing: $isEditing, text: $text)
                            .edgesIgnoringSafeArea(.top)
                            .onTapGesture {
                                isEditing = true
                            }
                        
                        if isEditing == true && text.count > 2 {
                            HStack {
                                Text("Resultados da busca")
                                    .font(.custom("SF Pro Display Bold", size: 24))
                                    .lineLimit(2)
                                    .foregroundColor(.primitiveBlack)
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                HStack {
                                    ForEach(recipes) { recipe in
                                        if recipe.name.localizedCaseInsensitiveContains(text) && (text.count > 2){
                                            Card(photo: Binding.constant(recipe.image),
                                                 title: Binding.constant(recipe.name),
                                                 tag: Binding.constant(recipe.lvl))
                                        }
                                    }
                                }
                                
                            }.padding(16)
                            
                        }
                    }
                    
                    SectionsView(recipes: recipes)
                    
                }.onAppear() {
                    AppDataService().getRecipes { (recipes) in
                        self.recipes = recipes
                    }
                }
                
            }.navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct SectionsView: View {
    let recipes: [RecipeElement]
    
    var body: some View {
        ZStack {
            Color.primitive50
                .ignoresSafeArea()
            
            // MARK: - All Categories
            
            ScrollView {
                VStack(spacing:48) {
                    
                    //MARK: - Breakfast
                    VStack {
                        HStack {
                            
                            Text("Café da manhã")
                                .font(.custom("Albra Semi", size: 56))
                                .foregroundColor(Color.primitiveBlack)
                                .minimumScaleFactor(0.5)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(recipes) { recipe in
                                    if recipe.category.contains(CategoryEnum(rawValue: "Café da manhã")!) {
                                        
                                        NavigationLink(
                                            destination: RecipeView(recipe: recipe),
                                            label: {
                                                Card(photo: Binding.constant(recipe.image),
                                                     title: Binding.constant(recipe.name),
                                                     tag: Binding.constant(recipe.lvl))
                                            })//.navigationTitle("Início")
                                    }
                                }
                            }
                            
                        }.padding(16)
                    }
                    
                    //MARK: - Sweet potatoes
                    VStack {
                        HStack {
                            
                            Text("Receitas com batata-doce")
                                .font(.custom("Albra Semi", size: 56))
                                .foregroundColor(Color.primitiveBlack)
                                .minimumScaleFactor(0.5)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(recipes) { recipe in
                                    ForEach(recipe.ingredients, id: \.id) { ingredient in
                                        let ingredientName = ingredient.name.lowercased()
                                        if ingredientName.contains("batata-doce") {
                                            NavigationLink(
                                                destination: RecipeView(recipe: recipe),
                                                label: {
                                                    Card(photo: Binding.constant(recipe.image),
                                                         title: Binding.constant(recipe.name),
                                                         tag: Binding.constant(recipe.lvl))
                                                })//.navigationTitle("Início")
                                        }
                                    }
                                }
                            }
                            
                        }.padding(16)
                    }
                    
                    //MARK: - Vegan
                    VStack {
                        HStack {
                            
                            Text("Para lanchar")
                                .font(.custom("Albra Semi", size: 56))
                                .foregroundColor(Color.primitiveBlack)
                                .minimumScaleFactor(0.5)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(recipes) { recipe in
                                    if recipe.category.contains(CategoryEnum(rawValue: "Sobremesa")!) {
                                        
                                        NavigationLink(
                                            destination: RecipeView(recipe: recipe),
                                            label: {
                                                Card(photo: Binding.constant(recipe.image),
                                                     title: Binding.constant(recipe.name),
                                                     tag: Binding.constant(recipe.lvl))
                                            })//.navigationTitle("Início")
                                    }
                                }
                            }
                            
                        }.padding(16)
                    }
                    
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
