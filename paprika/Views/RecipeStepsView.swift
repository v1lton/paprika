//
//  RecipeStepsView.swift
//  paprika
//
//  Created by Wilton Ramos on 16/07/21.
//

import SwiftUI
import StepperView

struct RecipeStepsView: View {
    
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            TabView {
                ForEach(viewModel.recipeSteps, id:\.self) { step in
                    HStack {
                        
                        //Title box
                        VStack {
                            Text(step[0]).font(.largeTitle).fontWeight(.black)
                        }.frame(width: geometry.size.width * 0.3, height: geometry.size.height, alignment: .topLeading)
                        
                        Spacer()
                        
                        //Recipe box
                        VStack {
                            Text(step[1])
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }.frame(width: geometry.size.width * 0.65, height: geometry.size.height, alignment: .topLeading)
                        
                    }.frame(height: geometry.size.height, alignment: .topLeading)
                    
                }
                
                Text("Final")
                
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct RecipeStepsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewModel = RecipeStepsView.ViewModel()
        
        Group {
            RecipeStepsView(viewModel: viewModel)
            RecipeStepsView(viewModel: viewModel)
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
        
    }
}
