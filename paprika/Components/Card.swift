//
//  card.swift
//  paprika
//
//  Created by iris on 22/07/21.
//

import SwiftUI

struct Card: View {

    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            VStack{
                //TODO: pegar a imagem da api
                Image("placeholder")
                
                VStack{
                    HStack{
                        //TODO: pegar o titulo da api
                        Text("Título da Receita")
                            .font(.custom("SF Pro Display Bold", size: 24))
                            .lineLimit(2)
                        Spacer()
                    }
                    Spacer(minLength: 12)
                    HStack{
                        Tag()
                        Spacer()
                        //TODO: if favoritado preencher o coração
                        Image(systemName: "heart")
                            .font(Font.system(size: 20, weight: .semibold))
                            .foregroundColor(Color("favoritedButton"))
                    }
                }.padding(24)
                
            }
        }.frame(width: 312, height: 472)
        .cornerRadius(8)
        .shadow(color: Color(#colorLiteral(red: 0.07843137255, green: 0.0862745098, blue: 0.1215686275, alpha: 0.102093425)), radius: 40, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct Tag: View {
    var body: some View{
        //TODO: iniciante, intermediário e dificil
        Text("Iniciante")
            .font(Font.system(size: 16))
            .foregroundColor(Color("inicianteFG"))
            .padding(.horizontal, 4)
            .padding(.vertical, 6)
            .background(Color("inicianteBG"))
            .cornerRadius(8)
    }
}

struct card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Card")
            .padding()
            .background(Color(.white))
        
    }
}
