//
//  Favorites.swift
//  paprika
//
//  Created by iris on 05/08/21.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var recipes: [RecipeElement]
    @Published var favorites: Set<String> = []
    let defaults = UserDefaults.standard
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Recipes") {
            if let decoded = try? JSONDecoder().decode([RecipeElement].self, from: data) {
                self.recipes = decoded
                return
            }
        }
        self.recipes = []
        self.favorites = Set(defaults.array(forKey: "Favorites") as? [String] ?? [])
    }
    func get() -> Int {
        favorites.count
    }
    func contains(_ recipe: RecipeElement) -> Bool {
        favorites.contains(recipe.name)
    }
    
    func add(_ recipe: RecipeElement) {
        favorites.insert(recipe.name)
        save()
    }
    
    func remove(_ recipe: RecipeElement) {
        favorites.remove(recipe.name)
        save()
    }
    
    func save() {
        let encoder = PropertyListEncoder()
                if let encoded = try? encoder.encode(self.recipes) {
                    self.defaults.set(encoded, forKey: "Recipes")
                }
                self.defaults.set(Array(self.favorites), forKey: "Favorites")
                defaults.synchronize()
    }
}
