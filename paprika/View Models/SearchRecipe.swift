////
////  SearchRecipe.swift
////  paprika
////
////  Created by Hugo Santos on 27/07/21.
////
//
//import SwiftUI
//
//class SearchRecipes: ObservableObject {
//    @Published var searchedRecipe: [RecipeElement] = []
//    
//    //User query...
//    @Published var query = ""
//    
//    //Current Result Page...
//    @Published var page = 1
//    
//    @State var recipesNames = [RecipeElement]()
//    
//    func getRecipes(completion:@escaping ([RecipeElement]) -> ()) {
//        if let path = Bundle.main.path(forResource: "RecipesTest", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(Recipe.self, from: data)
//                
//                DispatchQueue.main.async {
//                    let recipes = jsonData.recipes
//                    completion(recipes)
//                }
//                
//            } catch {
//                print("Erro na leitura do Json")
//            }
//        }
//    }
//    func find(){
//        //removing spaces
//        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
//        
//        ScrollView(.horizontal) {
//            HStack(spacing: 16){
//                ForEach(totalRecipes.filter({ "\($0)".contains(searchQuery)
//                    
//                })) { recipe in
//                    Card(photo: Binding.constant(recipe.image),
//                         title: Binding.constant(recipe.name),
//                         tag: Binding.constant(recipe.lvl),
//                         favorited: Binding.constant(recipe.favorited))
//                }
//            }.padding(16)
//            .onAppear() {
//                AppDataService().getRecipes { (totalRecipes) in
//                    self.totalRecipes = totalRecipes
//                }
//            }
//        }
//    
//    }
//}
