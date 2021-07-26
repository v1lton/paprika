//
//  RecipeView.swift
//  paprika
//
//  Created by Wilton Ramos on 21/07/21.
//

import SwiftUI

struct RecipeView: View {
    var recipe: RecipeElement
    
    var body: some View {
        Text(recipe.name)
        NavigationLink(
            destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel(), recipeSteps: recipe.stepByStep, recipeImage: recipe.image),
            label: {
                Text("Iniciar o passo a passo")
            }).navigationTitle("Receita")
    }
}


//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeView(recipe: <#Binding<RecipeElement>#>)
//    }
//}
