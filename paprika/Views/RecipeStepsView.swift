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
                    AdaptiveStack {
                        
                        //Title box
                        VStack {
                            Text(step[0])
                                .font(.custom("Albra Semi", size: 56))
                                .foregroundColor(Color("BrandSecondary400"))
                        }.frame(width: geometry.size.width * 0.3, height: geometry.size.height, alignment: .topLeading)
                        
                        Spacer()
                        
                        //Recipe box
                        VStack {
                            Text(step[1])
                                .fontWeight(.regular)
                                .lineSpacing(10)
                                .font(.system(size: 32))
                        }.frame(width: geometry.size.width * 0.65, height: geometry.size.height, alignment: .topLeading)
                        
                    }.frame(height: geometry.size.height, alignment: .topLeading)
                    
                }
                
                Text("Final")
                
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }.background(Color("Primitive50")).edgesIgnoringSafeArea(.all)
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

struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

//TODO: Fazer um adapative stack baseado no geometryReader
//FIXME: OI SWIFTUI
