//
//  AppDataService.swift
//  paprika
//
//  Created by Wilton Ramos on 22/07/21.
//

import Foundation

class AppDataService {
    
    func getRecipes(completion:@escaping ([RecipeElement]) -> ()) {
        if let path = Bundle.main.path(forResource: "RecipesTest", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Recipe.self, from: data)
                
                DispatchQueue.main.async {
                    let recipes = jsonData.recipes
                    completion(recipes)
                }
                
            } catch {
                print("Erro na leitura do Json")
            }
        }
    }
    
}
