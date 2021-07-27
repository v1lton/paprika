//
//  SideBarView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

import SwiftUI

struct SideBarView: View {
    
    var body: some View {
        List {
            NavigationLink(
                destination: HomeView(),
                label: {
                    Label("Página Inicial", systemImage: "house")
                })
            NavigationLink(
                destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel(), recipeSteps: [StepByStep]()),
                label: {
                    Label("Favoritos", systemImage: "heart")
                })
            Text("Momento")
                .font(.custom("SF Pro Display Semibold", size: 20))
                .padding(.top, 16.0)
            NavigationLink(
                destination: HomeView(),
                label: {
                    Text("Café-da-Manhã")
                })
            NavigationLink(
                destination: HomeView(),
                label: {
                    Text("Almoço")
                })
            NavigationLink(
                destination: HomeView(),
                label: {
                    Text("Jantar")
                })
            Text("Dificuldade")
                .font(.custom("SF Pro Display Semibold", size: 20))
                .padding(.top, 16.0)
            NavigationLink(
                destination: HomeView(),
                label: {
                    Text("Iniciante")
                })
            NavigationLink(
                destination: HomeView(),
                label: {
                    Text("Intermediário")
                })
            NavigationLink(
                destination: HomeView(),
                label: {
                    Text("Avançado")
                })
        }.navigationTitle("Paprika")
        .listStyle(SidebarListStyle())
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
