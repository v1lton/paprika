//
//  SideBarView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

import SwiftUI
import UIKit

struct SideBarView: View {
    @Binding var recipes: [RecipeElement]
    
    private func getRecipes(byCategory category: String) -> [RecipeElement] {
        var recipesByCategory = [RecipeElement]()
        
        for recipe in recipes {
            if recipe.category.contains(CategoryEnum(rawValue: category)!) {
                recipesByCategory.append(recipe)
            }
        }
        
        return recipesByCategory
    }
    
    private func getRecipes(byLevel lvl: String) -> [RecipeElement] {
        var recipesByCategory = [RecipeElement]()
        
        for recipe in recipes {
            if recipe.lvl == lvl {
                recipesByCategory.append(recipe)
            }
        }
        
        return recipesByCategory
    }
    
    var body: some View {
        List {
            NavigationLink(
                destination: HomeView(recipes: $recipes),
                label: {
                    Label("Página Inicial", systemImage: "house")
                })
            NavigationLink(
                destination: FavoritesView(recipes: recipes),
                label: {
                    Label("Favoritos", systemImage: "heart")
                })
            Text("Momento")
                .font(.custom("SF Pro Display Semibold", size: 20))
                .padding(.top, 16.0)
            NavigationLink(
                destination: GridView(recipes: Binding.constant(getRecipes(byCategory: "Café da manhã")), title: "Café da Manhã"),
                label: {
                    Text("Café-da-Manhã")
                })
            NavigationLink(
                destination: GridView(recipes: Binding.constant(getRecipes(byCategory: "Almoço")), title: "Almoço"),
                label: {
                    Text("Almoço")
                })
            NavigationLink(
                destination: GridView(recipes: Binding.constant(getRecipes(byCategory: "Janta")), title: "Janta"),
                label: {
                    Text("Janta")
                })
            Text("Dificuldade")
                .font(.custom("SF Pro Display Semibold", size: 20))
                .padding(.top, 16.0)
            NavigationLink(
                destination: GridView(recipes: Binding.constant(getRecipes(byLevel: "Fácil")), title: "Iniciante"),
                label: {
                    Text("Iniciante")
                })
            NavigationLink(
                destination: GridView(recipes: Binding.constant(getRecipes(byLevel: "Intermediário")), title: "Intermediário"),
                label: {
                    Text("Intermediário")
                })
            NavigationLink(
                destination: GridView(recipes: Binding.constant(getRecipes(byLevel: "Difícil")), title: "Avançado"),
                label: {
                    Text("Avançado")
                })
        }.navigationTitle("Paprika")
        .listStyle(SidebarListStyle())
        .onAppear {
            let rootViewController = UIApplication.shared.windows.first { $0.isKeyWindow }!.rootViewController
            guard
                let splitViewController = rootViewController?.children.first as? UISplitViewController,
                let sidebarViewController = splitViewController.viewController(for: .primary) else {
                return
            }
            let tableView = UITableView.appearance(whenContainedInInstancesOf: [type(of: sidebarViewController)])
            tableView.backgroundColor = UIColor(Color.primitiveWhite)
        }
    }
}
