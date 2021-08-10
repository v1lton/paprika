//
//  RecipeView.swift
//  paprika
//
//  Created by Wilton Ramos on 21/07/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeView: View {
    var recipe: RecipeElement
    
    var body: some View {
        GeometryReader { geometry in
            
            HStack() {
                LeftView(recipe: recipe)
                    .frame(width: geometry.size.width * 0.45)
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                
                Spacer()
                
                Divider()
                
                Spacer()
                
                RightView(recipe: recipe, recipePortion: recipe.portion)
                    .frame(width: geometry.size.width * 0.45)
                    .padding(.trailing, 20)
            }
        }
    }
}

struct LeftView: View {
    var recipe: RecipeElement
    
    var body: some View {
        GeometryReader { geometry in
            //Most out VStack
            
            VStack {
                
                WebImage(url: URL(string: recipe.image))
                    .resizable()
                    .placeholder(Image("placeholder"))
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: geometry.size.width ,height: geometry.size.height * 0.46)
                    .clipped()
                    //.scaledToFill()
                    //.aspectRatio(contentMode: .fill)
                    
                    //.scaledToFill()
                
                VStack{
                    HStack{
                        Text(recipe.name)
                            .font(.custom("Albra Semi", size: 44))
                            .foregroundColor(Color.primitiveBlack)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Spacer()
                    }
                    
                    
                    HStack{
                        Text("por")
                            .font(.custom("SF Pro Display Regular", size: 16))
                            .foregroundColor(Color.primitive600)
                            .padding(.trailing, -2)
                        
                        if recipe.author != ""{
                            Text(recipe.author)
                                .font(.custom("SF Pro Display Regular", size: 16))
                                .foregroundColor(Color.brandPrimary400)
                                .underline()
                                .onTapGesture {
                                    if recipe.creditsURL != "" {
                                        UIApplication.shared.open(URL(string: recipe.creditsURL)!, options: [:])
                                    }
                                }
                        } else {
                            Text("Paprika")
                                .font(.custom("SF Pro Display Regular", size: 16))
                                .foregroundColor(Color.primitive600)
                        }
                        
                        
                        
                        Spacer()
                    }
                }
                
                Spacer()
                    .frame(height: 24)
                
                //MARK: -Info box
                HStack {
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            Spacer()
                                .frame(width: 16)
                            
                            Image(systemName: "flag")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color.brandSecondary400)
                            
                            Text("Nível de dificuldade:")
                                .font(.custom("SF Pro Display Semibold", size: 20))
                                .foregroundColor(Color.brandSecondary400)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            Text((recipe.lvl == "Fácil") ? "Iniciante" : recipe.lvl)
                                .font(Font.system(size: 16))
                                .foregroundColor((recipe.lvl == "Fácil") ? .positiveFeedback800 : (recipe.lvl == "Intermediário") ? .alertFeedback700 : .brandPrimary600)
                                .padding(.horizontal, 4)
                                .padding(.vertical, 6)
                                .background((recipe.lvl == "Fácil") ? Color.positiveFeedback50 : (recipe.lvl == "Intermediário") ? Color.alertFeedback50 : Color.alertFeedback50)
                                .cornerRadius(8)
                        }
                        Spacer()
                        HStack{
                            Spacer()
                                .frame(width: 16)
                            
                            Image(systemName: "clock")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color.brandSecondary400)
                            
                            Text("Tempo de Preparo:")
                                .font(.custom("SF Pro Display Semibold", size: 20))
                                .foregroundColor(Color.brandSecondary400)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            Text((recipe.totalTime) >= 60 ? "~\(recipe.totalTime/60)h" : "~\(recipe.totalTime)min")
                                .font(.custom("SF Pro Display Semibold", size: 20))
                                .foregroundColor(Color.primitive700)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: geometry.size.width * 0.9, idealHeight: 100, maxHeight: 100, alignment: .leading)
                    .background(Color.primitiveWhite)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.brandSecondary400, lineWidth: 1)
                    )
                    
                    Spacer()
                }
                
                Spacer()
                
                //MARK: - Bottom buttons
                HStack {
                    
                    NavigationLink(
                        destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel(), recipeSteps: recipe.stepByStep, recipeImage: recipe.image),
                        label: {
                            HStack{
                                Text("Começar o passo a passo")
                                    .font(.custom("SF Pro Display Semibold", size: 20))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.3)
                                Image(systemName: "play.fill")
                                    .font(.system(size: 20, weight: .semibold))
                                    .minimumScaleFactor(0.3)
                                    .lineLimit(1)
                            }
                        }
                    )
                    .padding(.all, 12)
                    .minimumScaleFactor(0.5)
                    //.frame(width: 278, height: 48, alignment: .center)
                    .background(Color.brandPrimary400)
                    .foregroundColor(Color.primitiveWhite)
                    .cornerRadius(8)
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 32, weight: .medium))
                            .foregroundColor(Color.brandPrimary400)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "heart")
                            .font(.system(size: 32, weight: .medium))
                            .foregroundColor(Color.brandPrimary400)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                    })
                }.frame(maxWidth: geometry.size.width)
            }
        }
        
    }
}


struct RightView: View {
    @State private var value: Int
    var recipe: RecipeElement
    
    init(recipe: RecipeElement, recipePortion: Int) {
        self.recipe = recipe
        self.value = recipePortion
    }
    
    func incrementStep() {
        if value < 12 {
            value += 1
        }
    }
    
    func decrementStep() {
        if value > 1 {
            value -= 1
        }
    }
    
    func getAllIngredients() -> String {
        var ingredients: String = ""
        for ingredient in recipe.ingredients {
            ingredients = ingredients + String(ingredient.amount * Double(value)) + " " + ingredient.name + "\n"
        }
        return ingredients
    }
    
    func getAllSteps() -> String {
        var steps: String = recipe.name + "\n\n"
        
        for step in recipe.stepByStep {
            if step.id < recipe.stepByStep.count {
                steps = steps + step.title + ":\n" + step.stepByStepDescription + "\n\n"
            } else {
                steps = steps + step.title + ":\n" + step.stepByStepDescription
            }
        }
        
        return steps
    }
    
    func fractionToString (fraction: Double) -> String {
        switch fraction {
        case 0.125..<0.126:
            return NSLocalizedString("\u{215B}", comment: "1/8")
        case 0.25..<0.26:
            return NSLocalizedString("\u{00BC}", comment: "1/4")
        case 0.33..<0.34:
            return NSLocalizedString("\u{2153}", comment: "1/3")
        case 0.5..<0.6:
            return NSLocalizedString("\u{00BD}", comment: "1/2")
        case 0.66..<0.67:
            return NSLocalizedString("\u{2154}", comment: "2/3")
        case 0.75..<0.76:
            return NSLocalizedString("\u{00BE}", comment: "3/4")
        default:
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            formatter.numberStyle = .decimal
            return formatter.string(from: fraction as NSNumber)!
        }
    }
    
    func setPluralOrSingular(forMeasure measure: String, forAmount amount: Double) -> String {
        var measureLowerCased = measure.lowercased()
        let value = (amount * Double(Double(value) / Double(recipe.portion)))
        
        if value < 2 {
            return measureLowerCased
        }
        
        if (measureLowerCased.contains("colher")) {
            measureLowerCased = measureLowerCased.replacingOccurrences(of: "colher", with: "colheres")
        } else if (measureLowerCased.contains("xícara")) {
            measureLowerCased = measureLowerCased.replacingOccurrences(of: "xícara", with: "xícaras")
        } else {
            measureLowerCased = measureLowerCased + "s"
        }
        
        return measureLowerCased
    }
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                //MARK: - Ingredients
                //MARK: - Ingredients Header
                VStack{
                    VStack {
                        HStack {
                            Text("Ingredientes")
                                .font(.custom("Albra Semi", size: 32))
                                .foregroundColor(Color.primitiveBlack)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .onDrag {
                                    NSItemProvider(object: getAllIngredients() as NSString)
                                }
                            Spacer()
                        }
                        
                        Divider()
                        
                        Stepper(onIncrement: {
                            incrementStep()
                        }, onDecrement: {
                            decrementStep()
                        }, label: {
                            HStack {
                                if (value == 1) {
                                    Image(systemName: "person")
                                        .font(.custom("SF Pro Display Semibold", size: 20))
                                        .foregroundColor(Color.brandSecondary400)
                                } else {
                                    Image(systemName: "person.2")
                                        .font(.custom("SF Pro Display Semibold", size: 20))
                                        .foregroundColor(Color.brandSecondary400)
                                }
                                
                                Text("Porções: \(value)")
                                    .font(.custom("SF Pro Display Semibold", size: 20))
                                    .foregroundColor(Color.brandSecondary400)
                            }
                            
                        })
                        
                        Divider()
                        
                    }
                    
                    //MARK: - Ingredients Body
                    ForEach(recipe.ingredients, id:\.id) { ingredient in
                        HStack {
                            Text("\u{2022}")
                                .font(.custom("SF Pro Display Regular", size: 20))
                                .foregroundColor(Color.primitiveBlack)
                                .layoutPriority(1)
                            
                            Text(ingredient.name.capitalizingFirstLetter())
                                .font(.custom("SF Pro Display Regular", size: 20))
                                .foregroundColor(Color.primitiveBlack)
                                .layoutPriority(1)
                            
                            Text("....................................................................................................................................................................................").font(.custom("SF Pro Display Regular", size: 20))
                                .foregroundColor(Color.primitiveBlack)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text(fractionToString(fraction: ingredient.amount * Double(Double(value) / Double(recipe.portion))))
                                .font(.custom("SF Pro Display Regular", size: 20))
                                .foregroundColor(Color.primitiveBlack)
                                .layoutPriority(1)
                            
                            Text(setPluralOrSingular(forMeasure: ingredient.measure, forAmount: ingredient.amount))
                                .font(.custom("SF Pro Display Regular", size: 20))
                                .foregroundColor(Color.primitiveBlack)
                                .layoutPriority(1)
                                
                        }.padding(.bottom, 8)
                        .onDrag {
                            NSItemProvider(object: "\(ingredient.amount * Double(value)) \(ingredient.name)" as NSString)
                        }
                    }
                }.padding(.bottom, 64)
                
                Spacer()
                
                //MARK: - Steps
                //MARK: - Steps Header
                VStack{
                    HStack {
                        Text("Passo-a-Passo")
                            .font(.custom("Albra Semi", size: 32))
                            .foregroundColor(Color.primitiveBlack)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Spacer()
                        
                        NavigationLink(
                            destination: RecipeStepsView(viewModel: RecipeStepsView.ViewModel(), recipeSteps: recipe.stepByStep, recipeImage: recipe.image),
                            label: {
                                HStack{
                                    Text("Começar agora")
                                        .font(.custom("SF Pro Display Semibold", size: 20))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 20, weight: .semibold))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                        )
                        .padding(.all, 12)
                        .background(Color.primitiveWhite)
                        .foregroundColor(Color.brandPrimary400)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.primitive200, lineWidth: 1)
                        )
                        
                    }.padding(.bottom, 16)
                    //MARK: - Steps body
                    ForEach(recipe.stepByStep, id: \.id) { step in
                        HStack() {
                            Text("\(step.id)")
                                .font(.custom("Albra Semi", size: 32))
                                .foregroundColor(Color.brandSecondary400)
                            
                            Spacer()
                            
                            HStack {
                                
                                Text(step.stepByStepDescription)
                                    .font(.custom("SF Pro Display Regular", size: 20))
                                    .foregroundColor(Color.primitiveBlack)
                                
                                Spacer()
                            }.padding(.leading, 16)
                            
                        }.padding(.all, 16)
                        .onDrag {
                            NSItemProvider(object: getAllSteps() as NSString)
                        }
                        
                        Divider()
                        
                    }
                }
            }
        }
        
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
