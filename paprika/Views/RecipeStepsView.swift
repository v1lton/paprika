//
//  RecipeStepsView.swift
//  paprika
//
//  Created by Wilton Ramos on 16/07/21.
//

import SwiftUI
import StepperView
import SDWebImageSwiftUI

struct FinalStepView: View {
    var recipeImage: String
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack {
                
                VStack {
                    WebImage(url: URL(string: recipeImage))
                        .resizable()
                        .placeholder(Image("placeholder"))
                        .transition(.fade(duration: 0.5))
                        .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.45)
                        .scaledToFit()
                        
                }.frame(width: geometry.size.width * 0.45, height: geometry.size.height, alignment: .topLeading)
                
                VStack {
                    Text("Bom apetite!")
                        .font(.custom("Albra Semi", size: 56))
                        .foregroundColor(Color.brandSecondary400)
                        .frame(width: geometry.size.width * 0.50, alignment: .leading)
                    
                    Text("Lembrou de alguém que também iria gostar dessa receita? Compartilhe! \nVocê também pode salvá-la nos seus Favoritos para ver sempre que quiser.")
                        .font(.custom("SF-Pro-Display-Medium", size: 32))
                        .lineSpacing(10)
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Compartilhar essa receita")
                            .foregroundColor(Color.brandPrimary400)
                            .font(.custom("SF-Pro-Display-Bold", size: 24))
                                                        
                    })
                    .frame(width: geometry.size.width * 0.50, height: 56, alignment: .center)
                    .foregroundColor(Color.primitiveWhite)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Salvar nos favoritos")
                            .foregroundColor(Color.brandPrimary400)
                            .font(.custom("SF-Pro-Display-Bold", size: 24))
                    })
                    .frame(width: geometry.size.width * 0.50, height: 56, alignment: .center)
                    .foregroundColor(Color.primitiveWhite)
                    
                }.frame(width: geometry.size.width * 0.50, height: geometry.size.height, alignment: .topTrailing)
                
            }
            
        }
    }
}

struct RecipeStepsView: View {
    
    @StateObject var viewModel: ViewModel
    var recipeSteps: [StepByStep]
    var recipeImage: String
    
    init(viewModel: ViewModel, recipeSteps steps: [StepByStep], recipeImage image: String) {
        _viewModel = StateObject(wrappedValue: viewModel)
        recipeSteps = steps
        recipeImage = image
    }
    
    var body: some View {

        GeometryReader { geometry in
            
            TabView {
                ForEach(recipeSteps, id:\.self) { step in
                    HStack{
                        
                        //Title box
                        VStack {
                            Text(step.title)
                                .font(.custom("Albra Semi", size: 56))
                                .foregroundColor(Color.brandSecondary400)
                        }.frame(width: geometry.size.width * 0.3, height: geometry.size.height, alignment: .topLeading)
                        
                        Spacer()
                        
                        //Recipe box
                        VStack {
                            Text(step.stepByStepDescription)
                                .lineSpacing(10)
                                .font(.custom("SF-Pro-Display-Medium", size: 32))
                        }.frame(width: geometry.size.width * 0.65, height: geometry.size.height, alignment: .topLeading)
                        
                    }.frame(height: geometry.size.height, alignment: .topLeading)
                    
                }
                
                FinalStepView(recipeImage: self.recipeImage)
                
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }.background(Color.primitive50).edgesIgnoringSafeArea(.all)
    }
}

struct FinalStepView_Previes: PreviewProvider {
    static var previews: some View {
        Group {
            FinalStepView(recipeImage: "")
            FinalStepView(recipeImage: "")
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
    }
}

//struct RecipeStepsView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let viewModel = RecipeStepsView.ViewModel()
//        
//        Group {
//            RecipeStepsView(viewModel: viewModel)
//            RecipeStepsView(viewModel: viewModel)
//                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
//        }
//        
//    }
//}

//TODO: Fazer um adapative stack baseado no geometryReader

