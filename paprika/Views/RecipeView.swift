//
//  RecipeView.swift
//  paprika
//
//  Created by Wilton Ramos on 21/07/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeView: View {
    var recipe: RecipeElement
    
    var body: some View {
        GeometryReader { geometry in
            
            HStack() {
                LeftView(recipe: recipe)
                    .frame(width: geometry.size.width * 0.45)
                
                Spacer()
                
                RightView(recipe: recipe)
                    .frame(width: geometry.size.width * 0.45)
            }//.background(Color.primitive50).edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct LeftView: View {
    var recipe: RecipeElement
    
    var body: some View {
        GeometryReader { geometry in
            //Most out VStack
            
            VStack {
                
                WebImage(url: URL(string: recipe.image))
                    .resizable()
                    .placeholder(Image("placeholder"))
                    .transition(.fade(duration: 0.5))
                    .frame(width: geometry.size.width * 0.94, height: geometry.size.height * 0.46)
                    .scaledToFit()
                
                VStack{
                    HStack{
                        Text(recipe.name)
                        Spacer()
                    }
                    
                    
                    HStack{
                        Text("por")
                        Text((recipe.author) != "" ? recipe.author : "Paprika")
                        Spacer()
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            Text("Nível de dificuldade:")
                            
                            Text(recipe.lvl)
                        }
                        Spacer()
                        HStack{
                            Text("Tempo de Preparo:")
                            
                            Text((recipe.totalTime) >= 60 ? "~\(recipe.totalTime/60)h" : "~\(recipe.totalTime)min")
                        }
                        Spacer()
                    }.frame(width: 377, height: 100)
                    .background(Color.primitiveWhite)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                                   .stroke(Color.brandSecondary400, lineWidth: 1)
                    )
                    
                    Spacer()

                }
                
                Spacer()
                
                HStack {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Começar o passo a passo")
                    })
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("<3")
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("SS")
                    })
                }
            }
        }
        
    }
}


struct RightView: View {
    @State private var value: Int
    var recipe: RecipeElement
    
    init(recipe: RecipeElement) {
        self.recipe = recipe
        self.value = recipe.portion
    }
    
    func incrementStep() {
        if value < 12 {
            value += 1
        }
    }
    
    func decrementStep() {
        if value > 1 {
            value -= 1
        }
    }
    
    
    var body: some View {
        VStack {
            //MARK: - Ingredients
            VStack{
                
                HStack{
                    Text("Ingredientes")
                    
                    Spacer()
                    
                    Stepper(onIncrement: {
                        incrementStep()
                    }, onDecrement: {
                        decrementStep()
                    }, label: {
                        Text("Porções: \(value)")
                    })
                }
            
                
                ForEach(recipe.ingredients, id:\.id) { ingredient in
                    HStack {
                        
                        Text(String(ingredient.amount * Double(value)))
                        
                        Text(ingredient.name)
                        
                        Spacer()
                    }
                }
            }
            
            Spacer()
            
            //MARK: - Steps
            VStack{
                HStack {
                    Text("Passo-a-Passo")
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Começar agora")
                        
                    })
                }
            }
        }
    }
}
