//
//  RecipeStepsView.swift
//  paprika
//
//  Created by Wilton Ramos on 16/07/21.
//

import SwiftUI
import StepperView
import SDWebImageSwiftUI

struct RecipeStepsView: View {
    
    var recipe: RecipeElement
    
    var body: some View {
        
        GeometryReader { geometry in
            
            TabView {
                
                ForEach(recipe.stepByStep, id:\.self) { step in
                    
                    VStack {
                        HStack(alignment: .top){
                            
                            //MARK: - Title box
                            
                            Text(step.title)
                                .frame(width: geometry.size.width * 0.3, alignment: .leading)
                                .font(.custom("Albra Semi", size: 56))
                                .foregroundColor(Color.brandSecondary400)
                                .minimumScaleFactor(0.3)
                            
                            Spacer()
                            
                            //MARK: - Description and timer box
                            VStack {
                                Text(step.stepByStepDescription)
                                    .lineSpacing(10)
                                    .font(.custom("SF Pro Display Regular", size: 32))
                                    .onDrag {
                                        NSItemProvider(object: step.stepByStepDescription as NSString)
                                    }
                                
                                Spacer().frame(height: 32)
                                
                                if let timer = step.timeInMinutes {
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        HStack {
                                            Text("Ativar timer (\(timer) min)")
                                                .font(.custom("SF Pro Display Bold", size: 24))
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.3)
                                            
                                            Image(systemName: "clock")
                                                .font(.custom("SF Pro Display Bold", size: 24))
                                                .minimumScaleFactor(0.3)
                                        }
                                        
                                    })
                                    .frame(width: geometry.size.width * 0.60, height: 56, alignment: .center)
                                    .background(Color.primitiveWhite)
                                    .foregroundColor(Color.brandPrimary400)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.primitive200, lineWidth: 1)
                                    )
                                }
                                
                                
                            }.frame(width: geometry.size.width * 0.60)
                        }
                        
                        Spacer()
                        
                    }.frame(width: geometry.size.width * 0.95)
                }
                
                FinalStepView(recipe: recipe)
                
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            
        }.background(Color.primitive50).edgesIgnoringSafeArea(.all)
    }
}

struct FinalStepView: View {
    @State var favorited: Bool = false
    @StateObject var favorites = Favorites()
    var recipe: RecipeElement
    
    func toogleFavorited() {
        favorited.toggle()
        
        if self.favorites.contains(self.recipe) {
            self.favorites.remove(self.recipe)
        }
        else {
            self.favorites.add(self.recipe)
        }
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            
            HStack(alignment: .top) {
                Spacer()
                
                WebImage(url: URL(string: recipe.image))
                    .resizable()
                    .placeholder(Image("placeholder"))
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.45)
                    .clipped()
                
                Spacer().frame(width: 16)
                
                VStack {
                    Text("Bom apetite!")
                        .font(.custom("Albra Semi", size: 56))
                        .foregroundColor(Color.brandSecondary400)
                        .frame(width: geometry.size.width * 0.50, alignment: .leading)
                    
                    Spacer().frame(height: 16)
                    
                    Text("Lembrou de alguém que também iria gostar dessa receita? Compartilhe! Você também pode salvá-la nos seus Favoritos para ver sempre que quiser.")
                        .font(.custom("SF Pro Display Regular", size: 28))
                        .lineSpacing(10)
                        .minimumScaleFactor(0.3)
                    
                    Spacer()
                    
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                        HStack {
//
//                            Text("Compartilhar essa receita")
//                                .font(.custom("SF Pro Display Bold", size: 24))
//                                .lineLimit(1)
//                                .minimumScaleFactor(0.3)
//
//                            Image(systemName: "square.and.arrow.up")
//                                .font(.custom("SF Pro Display Bold", size: 24))
//                                .minimumScaleFactor(0.3)
//                        }
//                    })
//                    .frame(width: geometry.size.width * 0.50, height: 56, alignment: .center)
//                    .background(Color.primitiveWhite)
//                    .foregroundColor(Color.brandPrimary400)
//                    .cornerRadius(8)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.primitive200, lineWidth: 1)
//                    )
                    
                    //Spacer().frame(maxHeight: 16)
                    
                    Button(action: {
                        toogleFavorited()
                    }, label: {
                        HStack {
                            Text(favorited ? "Receita Salva!" : "Salvar Receita" )
                                .font(.custom("SF Pro Display Bold", size: 24))
                                .lineLimit(1)
                                .minimumScaleFactor(0.3)
                            
                            Image(systemName: favorited ? "heart.fill" : "heart")
                                .font(.custom("SF Pro Display Bold", size: 24))
                                .minimumScaleFactor(0.3)
                        }
                        .frame(width: geometry.size.width * 0.50, height: 56, alignment: .center)
                        .background(favorited ? Color.brandPrimary400 : Color.primitiveWhite)
                        .foregroundColor(favorited ? .white : Color.brandPrimary400)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(favorited ? Color.brandPrimary400 : Color.primitive200, lineWidth: 1)
                        )
                    })
                    
                }.frame(width: geometry.size.width * 0.50, height: geometry.size.height * 0.45)
                
                Spacer()
                
            }
            
        }.onAppear() {
            if self.favorites.contains(recipe) {
                favorited = true
            }
        }
    }
}

