//
//  CustomSearchBar.swift
//  paprika
//
//  Created by Hugo Santos on 27/07/21.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var isEditing: Bool
    @Binding var text: String
    var body: some View {
        
        HStack(spacing: 12){
            
            TextField("Pesquise por nome, ingrediente ou categoria", text: $text)
                .padding(15)
                .padding(.horizontal, 35)
                .foregroundColor(.primitive500)
                .cornerRadius(10)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.primitive500)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if isEditing == true{
                            Button(action: {
                                self.text = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color.primitive500)
                                    .padding(.trailing, 8 )
                            })
                        }
                        
                    }
                ).onTapGesture {
                    isEditing = true
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
        .background(Color.primitive100)
        .cornerRadius(10)
        .padding(10)
    }
    
}



