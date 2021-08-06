//
//  card.swift
//  paprika
//
//  Created by iris on 22/07/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Card: View {
   
    @Binding var recipe: RecipeElement
    @ObservedObject var favorites: Favorites
    
    var body: some View {
        ZStack{
            Color.primitiveWhite
            
            VStack{
                WebImage(url: URL(string: recipe.image))
                    .resizable()
                    .placeholder(Image("placeholder"))
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: 247, height: 240, alignment: .center)
                    .clipped()

                VStack{
                    HStack{
                        Text(recipe.name)
                            .font(.custom("SF Pro Display Bold", size: 20))
                            .lineLimit(2)
                            .foregroundColor(.primitiveBlack)
                        Spacer()
                    }
                    Spacer(minLength: 16)
                    HStack{
                        Text((recipe.lvl == "Fácil") ? "Iniciante" : recipe.lvl)
                            .font(Font.system(size: 16))
                            .foregroundColor((recipe.lvl == "Fácil") ? .positiveFeedback800 : (recipe.lvl == "Intermediário") ? .alertFeedback700 : .brandPrimary600)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 6)
                            .background((recipe.lvl == "Fácil") ? Color.positiveFeedback50 : (recipe.lvl == "Intermediário") ? Color.alertFeedback50 : Color.alertFeedback50)
                            .cornerRadius(8)
                        Spacer()
                        
                        Button(action: {
                            if self.favorites.contains(self.recipe) {
                                self.favorites.remove(self.recipe)
                            }
                            else {
                                self.favorites.add(self.recipe)
                            }
                            
                        }, label: {
                            Image(systemName: self.favorites.contains(recipe) ? "heart.fill" : "heart")
                                        .font(Font.system(size: 20, weight: .semibold))
                                        .foregroundColor(Color.brandPrimary400)
                        })
                    }
                }.padding(16)
            }
        }.frame(width: 247, height: 376)
        .cornerRadius(8)
        .shadow(color: Color(#colorLiteral(red: 0.07843137255, green: 0.0862745098, blue: 0.1215686275, alpha: 0.102093425)), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}
