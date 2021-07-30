//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? newJSONDecoder().decode(Recipe.self, from: jsonData)

import Foundation

// MARK: - Recipe
struct Recipe: Codable {
    let recipes: [RecipeElement]
}

// MARK: - RecipeElement
struct RecipeElement: Codable, Identifiable {
    let name: String
    let id: Int
    let image: String
    let creditsURL, author, lvl:  String
    let category: [CategoryEnum]
    let ingredients: [Ingredient]
    let portion: Int
    let tools: [String]
    let totalTime: Int
    let stepByStep: [StepByStep]
}

// MARK: - Ingredient
struct Ingredient: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let amount: Double
    let measure: String
}

// MARK: - StepByStep
struct StepByStep: Codable, Hashable, Identifiable {
    let id: Int
    let title, stepByStepDescription: String
    let timeInMinutes: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case stepByStepDescription = "description"
        case timeInMinutes
    }
}

// MARK: - LvlEnum
enum LvlEnum: String, Codable {
    case facil = "Fácil"
    case medio = "Intermediário"
    case dificil = "Difícil"
}

// MARK: - CategoryEnum
enum CategoryEnum: String, Codable {
    case sobremesa = "Sobremesa"
    case cafeDaManha = "Café da manhã"
    case almoco = "Almoço"
    case janta = "Janta"
    case vegano = "Vegano"
    case vegetariano = "Vegetariano"
}
