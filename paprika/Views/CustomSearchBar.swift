//
//  CustomSearchBar.swift
//  paprika
//
//  Created by Hugo Santos on 27/07/21.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @State private var isEditing = false
    @Binding var text: String
    var body: some View {
        
        HStack(spacing: 12){
            
            TextField("Pesquise por nome, ingrediente ou categoria", text: $text)
                .padding(15)
                .padding(.horizontal, 25)
                .foregroundColor(.primitive500)
                .cornerRadius(10)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.primitive500)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color.primitive500)
                                    .padding(.trailing, 8 ) // corrigir padding do botao
                            })
                        }
                        
                    }
                ).onTapGesture {
                    self.isEditing = true
                }
            if isEditing{
                Button(action:{
                    self.isEditing = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }){
                    Text("Cancel")
                        .foregroundColor(Color.brandPrimary400)
                        .padding(.trailing, 20)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                }
            }
            
        }
    }
    
}


