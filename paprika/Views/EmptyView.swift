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
            Spacer()
            Image("coffee")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 80.0, maxWidth: 380, minHeight: 80.0, maxHeight: 380)
            Spacer(minLength: 20)
            
            VStack(alignment: .leading){
                Text("Ops! Você ainda não favoritou nenhuma receita...")
                    .font(.custom("Albra Medium", size: 36))
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                    .foregroundColor(.primitiveBlack)
                    .padding(.bottom, 5)
                
                Text("Favorite novas receitas para que possa ver depois.")
                    .font(.custom("SF Pro Display Regular", size: 20))
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                    .foregroundColor(.primitive600)
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
