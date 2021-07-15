// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Recipe.self, from: jsonData)

import Foundation

// MARK: - Recipe
struct Recipe: Codable {
    let name: String
    let id: Int
    let image, lvl: String
    let favorited: Bool
    let category: [String]
    let ingredients: [[String]]
    let portion: String
    let tools: [String]
    let timer: [[Int]]
    let totalTime: Int
    let stepByStep: [[String]]
}
