//
//  HomeView.swift
//  paprika
//
//  Created by Wilton Ramos on 17/07/21.
//

import SwiftUI

struct HomeView: View {
    
    enum Screen: Hashable {
        case recipe, steps
    }
    
    var body: some View {
        
        NavigationView {
            
            //MARK: - SideBar
            List {
                NavigationLink(
                    destination: HomeView(),
                    label: {
                        Label("Página Inicial", systemImage: "house")
                    })
                NavigationLink(
                    destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel()),
                    label: {
                        Label("Favoritos", systemImage: "heart")
                    })
            }.navigationTitle("Descobrir")
            .listStyle(SidebarListStyle())
            
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
