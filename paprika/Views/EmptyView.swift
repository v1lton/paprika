//
//  EmptyView.swift
//  paprika
//
//  Created by Hugo Santos on 06/08/21.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        HStack {
            Image("coffee")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 380.0, height: 380.0)
                .padding(.leading, 40)
            Spacer(minLength: 20)
            VStack{
                Text("Ops! Você ainda não favoritou nenhuma receita...")
                    .font( .largeTitle)
                    .foregroundColor(.black)
                    .frame(width: 400, alignment: .leading)
                    .padding(.bottom, 20)
                Text("Favorite novas receitas para que possa ver depois.")
                    .font( .title3)
                    .foregroundColor(.gray)
                    .frame(width: 400,  alignment: .leading)
            }
            Spacer()
        }.padding()
    }
    
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
