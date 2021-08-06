//
//  GridView.swift
//  paprika
//
//  Created by Wilton Ramos on 05/08/21.
//

import SwiftUI

struct GridView: View {
    @Binding var recipes: [RecipeElement]
    @StateObject var favorites = Favorites()
    
    let title: String
    let gridItemLayout = [GridItem(.adaptive(minimum: 255, maximum: 255))]
    
    var body: some View {
        ZStack {
            
            Color.primitive50
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(title)
                        .font(.custom("Albra Semi", size: 56))
                        .foregroundColor(Color.primitiveBlack)
                    Spacer()
                }
                Spacer()
                    .frame(height: 32)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: gridItemLayout, alignment: .leading) {
                        ForEach(recipes) { recipe in
                            NavigationLink(
                                destination: RecipeView(recipe: recipe),
                                label: {
                                    Card(recipe: Binding.constant(recipe), favorites: favorites)
                                        .padding(.bottom, 10)
                                })
                        }
                    }
                }
            }.padding(.horizontal, 16)
        }.navigationBarTitle("", displayMode: .inline)
    }
}

