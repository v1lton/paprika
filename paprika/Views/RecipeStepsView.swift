//
//  RecipeStepsView.swift
//  paprika
//
//  Created by Wilton Ramos on 16/07/21.
//

import SwiftUI
import StepperView

struct FinalStepView: View {
    var body: some View {
        
        GeometryReader { geometry in
            HStack {
                
                VStack {
                    Image("placeholder")
                        .resizable()
                        .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.45)
                }.frame(width: geometry.size.width * 0.45, height: geometry.size.height, alignment: .topLeading)
                
                VStack {
                    Text("Title")
                        .font(.custom("Albra Semi", size: 56))
                        .foregroundColor(Color("BrandSecondary400"))
                    
                    Text("Lembrou de alguém que também iria gostar dessa receita? Compartilhe! \nVocê também pode salvá-la nos seus Favoritos para ver sempre que quiser.")
                }.frame(width: geometry.size.width * 0.50, height: geometry.size.height, alignment: .topTrailing)
                
            }
            
        }
    }
}

struct RecipeStepsView: View {
    
    @StateObject var viewModel: ViewModel
    var recipeSteps: [StepByStep]
    
    init(viewModel: ViewModel, recipeSteps steps: [StepByStep]) {
        _viewModel = StateObject(wrappedValue: viewModel)
        recipeSteps = steps
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
                                .foregroundColor(Color("BrandSecondary400"))
                        }.frame(width: geometry.size.width * 0.3, height: geometry.size.height, alignment: .topLeading)
                        
                        Spacer()
                        
                        //Recipe box
                        VStack {
                            Text(step.stepByStepDescription)
                                .fontWeight(.regular)
                                .lineSpacing(10)
                                .font(.system(size: 32))
                        }.frame(width: geometry.size.width * 0.65, height: geometry.size.height, alignment: .topLeading)
                        
                    }.frame(height: geometry.size.height, alignment: .topLeading)
                    
                }
                
                FinalStepView()
                
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }.background(Color("Primitive50")).edgesIgnoringSafeArea(.all)
    }
}

struct FinalStepView_Previes: PreviewProvider {
    static var previews: some View {
        Group {
            FinalStepView()
            FinalStepView()
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

