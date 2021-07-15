// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Recipe.self, from: jsonData)

import Foundation

// MARK: - Recipe
struct Recipe: Codable {
    let name: String
    let id: Int
    let image: String
    let lvl: LvlEnum
    let favorited: Bool
    let category: [CategoryEnum]
    let ingredients: [[Ingredient]]
    let portion: Int
    let tools: [String]
    let timer: [[Int]]
    let totalTime: Int
    let stepByStep: [[StepByStep]]
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let name: String
    let amount: Float
    let measure: String
}

// MARK: - StepByStep
struct StepByStep: Codable {
    let title: String
    let description: String
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




