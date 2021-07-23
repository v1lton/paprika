//
//  paprikaApp.swift
//  paprika
//
//  Created by Wilton Ramos on 15/07/21.
//

import SwiftUI

@main
struct paprikaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           // ContentView()
             //   .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //RecipeStepsView()
            HomeView()
        }
    }
}

//TODO: [] Carregar aqui?
