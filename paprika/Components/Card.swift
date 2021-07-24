//
//  card.swift
//  paprika
//
//  Created by iris on 22/07/21.
//

import SwiftUI

struct Card: View {
    
    @Binding var photo: String
    @Binding var title: String
    @Binding var tag: String
    @Binding var favorited: Bool
    
    var body: some View {
        ZStack{
            Color.primitiveWhite
            
            VStack{
                //TODO: pegar a imagem da api
                Image("placeholder")
                
                VStack{
                    HStack{
                        Text(title)
                            .font(.custom("SF Pro Display Bold", size: 24))
                            .lineLimit(2)
                            .foregroundColor(.primitiveBlack)
                        Spacer()
                    }
                    Spacer(minLength: 12)
                    HStack{
                        Text((tag == "Fácil") ? "Iniciante" : tag)
                            .font(Font.system(size: 16))
                            .foregroundColor((tag == "Fácil") ? .positiveFeedback800 : (tag == "Intermediário") ? .alertFeedback700 : .brandPrimary600)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 6)
                            .background((tag == "Fácil") ? Color.positiveFeedback50 : (tag == "Intermediário") ? Color.alertFeedback50 : Color.alertFeedback50)
                            .cornerRadius(8)
                        Spacer()
                        Image(systemName: favorited ? "heart.fill" : "heart")
                            .font(Font.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.brandPrimary400)
                    }
                }.padding(24)
                
            }
        }.frame(width: 312, height: 472)
        .cornerRadius(8)
        .shadow(color: Color(#colorLiteral(red: 0.07843137255, green: 0.0862745098, blue: 0.1215686275, alpha: 0.102093425)), radius: 40, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct card_Previews: PreviewProvider {
    static var previews: some View {
        Card(photo: Binding.constant("placeholder"), title: Binding.constant("Omelete"), tag: Binding.constant("Intermediário"), favorited: Binding.constant(true))
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Card")
            .padding()
            .background(Color(.white))

    }
}
