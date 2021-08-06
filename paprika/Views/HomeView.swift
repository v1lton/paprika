//
//  RootView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

// TODO: Retirar o título Início

import SwiftUI

struct HomeView: View {
    
    @Binding var recipes: [RecipeElement]
    let gridItemLayout = [GridItem(.adaptive(minimum: 255, maximum: 255))]
    @State var text = ""
    @State public var isEditing = false
    @StateObject var favorites = Favorites()
    @State var counter = 0
    var body: some View {
        ZStack {
            Color.primitive50
                .ignoresSafeArea()
            
            VStack{
                CustomSearchBar(isEditing: $isEditing, text: $text)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        isEditing = true
                    }
                Spacer()
                
                VStack {
                    VStack{
                        if isEditing == true && text.count > 2 {
                            ZStack {
                                VStack{
                                    if counter > 0 {
                                        HStack {
                                            Text("Resultados da busca")
                                                .font(.custom("Albra Semi", size: 56))
                                                .foregroundColor(Color.primitiveBlack)
                                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                            Spacer()
                                        }
                                    }
                                    ScrollView(showsIndicators: false){
                                        LazyVGrid(columns: gridItemLayout, alignment: .leading) {
                                            
                                            ForEach(recipes) { recipe in
                                                if recipe.name.localizedCaseInsensitiveContains(text) && (text.count > 2) {
                                                    NavigationLink(
                                                        destination: RecipeView(recipe: recipe),
                                                        label: {
                                                            Card(recipe: Binding.constant(recipe), favorites: favorites)
                                                                .padding(.bottom, 10)
                                                        }).onAppear{
                                                            counter += 1
                                                        }
                                                }
                                            }.onDisappear{
                                                counter = 0
                                            }
                                        }
                                    }
                                    
                                    
                                }.padding(.horizontal, 16)
                                
                                if counter == 0 {
                                    ScrollView(showsIndicators: false) {
                                        VStack{
                                            EmptySearchView()
                                            SectionsView(recipes: recipes)
                                                .padding(.top, 32)
                                        }
                                    }
                                }
                            }
                        } else {
                            SectionsView(recipes: recipes)
                                .padding(.top, 32)
                        }
                    }
                }
            }.navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct SectionsView: View {
    let recipes: [RecipeElement]
    @StateObject var favorites = Favorites()
    
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
                                .padding(.leading, 16)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(recipes) { recipe in
                                    if recipe.category.contains(CategoryEnum(rawValue: "Café da manhã")!) {
                                        
                                        NavigationLink(
                                            destination: RecipeView(recipe: recipe),
                                            label: {
                                                Card(recipe: Binding.constant(recipe), favorites: favorites)
                                            })
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
                                .padding(.leading, 16)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(recipes) { recipe in
                                    ForEach(recipe.ingredients) { ingredient in
                                        let ingredientName = ingredient.name.lowercased()
                                        if ingredientName.contains("batata-doce") {
                                            NavigationLink(
                                                destination: RecipeView(recipe: recipe),
                                                label: {
                                                    Card(recipe: Binding.constant(recipe), favorites: favorites)
                                                })
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
                                .padding(.leading, 16)
                            
                            Spacer()
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(recipes) { recipe in
                                    if recipe.category.contains(CategoryEnum(rawValue: "Sobremesa")!) {
                                        
                                        NavigationLink(
                                            destination: RecipeView(recipe: recipe),
                                            label: {
                                                Card(recipe: Binding.constant(recipe), favorites: favorites)
                                            })
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
