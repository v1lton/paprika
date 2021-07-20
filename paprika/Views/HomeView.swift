//
//  HomeView.swift
//  paprika
//
//  Created by Wilton Ramos on 17/07/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            
            NavigationLink(
                destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel()),
                label: {
                    Text("Ver receita")
                })
            
        }.navigationTitle("Menu")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
