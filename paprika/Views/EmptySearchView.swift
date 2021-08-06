//
//  SwiftUIView.swift
//  paprika
//
//  Created by Hugo Santos on 06/08/21.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {

        Image("coffee")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 380.0, height: 380.0)
            .padding(.leading, 40)
        Spacer(minLength: 20)
        VStack{
            Text("Ops! Ainda não temos resultado para essa pesquisa...")
                .font( .largeTitle)
                .foregroundColor(.black)
                .frame(width: 400, alignment: .leading)
                .padding(.bottom, 20)
            Text("Favorite novas receitas para que possa ver depois.")
                .font( .title3)
                .foregroundColor(.gray)
                .frame(width: 400,  alignment: .leading)
        }
        
    }
}

struct EmptySearchView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySearchView()
    }
}
