//
//  RootView.swift
//  paprika
//
//  Created by iris on 21/07/21.
//

import SwiftUI
struct HomeView: View {
    var body: some View {
        ZStack {
            Color.primitive100
                .ignoresSafeArea()
            
            VStack{
                CardsScroll()
                CardsScroll()
                Spacer()
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

