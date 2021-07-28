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
    @Binding var favorited: Bool
    var recipeImage: String
    
    var body: some View {
        
        GeometryReader { geometry in
            
            
            HStack(alignment: .top) {
                Spacer()
                
                WebImage(url: URL(string: recipeImage))
                    .resizable()
                    .placeholder(Image("placeholder"))
                    .transition(.fade(duration: 0.5))
                    .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.45)
                    .scaledToFit()
                
                Spacer().frame(width: 16)
                
                VStack {
                    Text("Bom apetite!")
                        .font(.custom("Albra Semi", size: 56))
                        .foregroundColor(Color.brandSecondary400)
                        .frame(width: geometry.size.width * 0.50, alignment: .leading)
                    
                    Spacer().frame(height: 8)
                    
                    Text("Lembrou de alguém que também iria gostar dessa receita? Compartilhe! Você também pode salvá-la nos seus Favoritos para ver sempre que quiser.")
                        .font(.custom("SF Pro Display Regular", size: 28))
                        .lineSpacing(10)
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Compartilhar essa receita")
                            .font(.custom("SF Pro Display Bold", size: 24))
                        
                    })
                    .frame(width: geometry.size.width * 0.50, height: 56, alignment: .center)
                    .background(Color.primitiveWhite)
                    .foregroundColor(Color.brandPrimary400)
                    .cornerRadius(8)
                    
                    Spacer().frame(maxHeight: 16)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Salvar nos favoritos")
                            
                            .font(.custom("SF Pro Display Bold", size: 24))
                    })
                    .frame(width: geometry.size.width * 0.50, height: 56, alignment: .center)
                    .background(Color.primitiveWhite)
                    .foregroundColor(Color.brandPrimary400)
                    .cornerRadius(8)
                    
                }.frame(width: geometry.size.width * 0.50, height: geometry.size.height * 0.45)
                
                Spacer()
                
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
                    
                    VStack {
                        HStack(alignment: .top){
                            
                            //MARK: - Title box
                            
                            Text(step.title)
                                .frame(width: geometry.size.width * 0.3, alignment: .leading)
                                .font(.custom("Albra Semi", size: 56))
                                .foregroundColor(Color.brandSecondary400)
                            
                            
                            Spacer()
                            
                            
                            //MARK: - Description and timer box
                            VStack {
                                Text(step.stepByStepDescription)
                                    .lineSpacing(10)
                                    .font(.custom("SF Pro Display Regular", size: 32))
                                
                                Spacer().frame(height: 32)
                                
                                if let timer = step.timeInMinutes {
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Text("Ativar timer (\(timer) min)")
                                            .foregroundColor(Color.brandPrimary400)
                                            .font(.custom("SF Pro Display Bold", size: 24))
                                    })
                                    .frame(width: geometry.size.width * 0.60, height: 56, alignment: .center)
                                    .foregroundColor(Color.primitiveWhite)
                                    .background(Color.primitiveWhite)
                                    .foregroundColor(Color.brandPrimary400)
                                    .cornerRadius(8)
                                }
                                
                                
                            }.frame(width: geometry.size.width * 0.60)
                        }
                        
                        Spacer()
                        
                    }.frame(width: geometry.size.width * 0.95)
                    
                    
                }
                FinalStepView(favorited: Binding.constant(false), recipeImage: self.recipeImage)
                
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            
        }.background(Color.primitive50).edgesIgnoringSafeArea(.all)
    }
}

struct FinalStepView_Previes: PreviewProvider {
    static var previews: some View {
        Group {
            FinalStepView(favorited: Binding.constant(false), recipeImage: "https://images.unsplash.com/photo-1568240464340-261c0f65a455?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80")
            FinalStepView(favorited: Binding.constant(false), recipeImage: "https://images.unsplash.com/photo-1568240464340-261c0f65a455?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80")
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

