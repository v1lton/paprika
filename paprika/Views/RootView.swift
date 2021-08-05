//
//  HomeView.swift
//  paprika
//
//  Created by Wilton Ramos on 17/07/21.
//

import SwiftUI

struct RootView: View {
   
    @State var recipes = [RecipeElement]()
    
    var body: some View {
        NavigationView {
            SideBarView(recipes: $recipes)
            HomeView(recipes: $recipes)
        }.onAppear() {
            AppDataService().getRecipes { (recipes) in
                self.recipes = recipes
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

