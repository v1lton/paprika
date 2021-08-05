//
//  GridView.swift
//  paprika
//
//  Created by Wilton Ramos on 05/08/21.
//

import SwiftUI

struct GridView: View {
    @Binding var recipes: [RecipeElement]
    let title: String
    
    let gridItemLayout = [GridItem(.adaptive(minimum: 312))]
    
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
                }.padding(.leading, 16)
                
                Spacer()
                    .frame(height: 32)
                
                ScrollView {
                    LazyVGrid(columns: gridItemLayout, spacing: 16) {
                        ForEach(recipes) { recipe in
                            Card(photo: Binding.constant(recipe.image), title: Binding.constant(recipe.name), tag: Binding.constant(recipe.lvl))
                        }
                    }
                }
                
            }
        }.navigationBarTitle("", displayMode: .inline)
    }
}

