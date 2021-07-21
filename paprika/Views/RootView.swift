//
//  RootView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack {
            NavigationLink(
                destination: RecipeView(),
                label: {
                    Text("Ver receita")
                })
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
