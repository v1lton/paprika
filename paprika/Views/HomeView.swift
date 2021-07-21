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
            
            //MARK: - SideBar
            List {
                NavigationLink(
                    destination: RecipeView(),
                    label: {
                        Label("Receita", systemImage: "book")
                    })
                NavigationLink(
                    destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel()),
                    label: {
                        Label("Passo a passo", systemImage: "book")
                    })
            }.navigationTitle("Descobrir")
            
            //MARK: - DetailView
            VStack {
                NavigationLink(
                    destination: RecipeView(),
                    label: {
                        Text("Ver receita")
                    })
            }
        }
        
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
