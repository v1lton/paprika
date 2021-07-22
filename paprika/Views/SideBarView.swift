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
                destination: RootView(),
                label: {
                    Label("Página Inicial", systemImage: "house")
                })
            NavigationLink(
                destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel(), recipeSteps: [StepByStep]()),
                label: {
                    Label("Favoritos", systemImage: "heart")
                })
        }.navigationTitle("Descobrir")
        .listStyle(SidebarListStyle())
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
