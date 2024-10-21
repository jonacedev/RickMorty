//
//  CustomSearchBar.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 20/10/24.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var text: String
    var placeholder: String
    var size: CGFloat = 50
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(isFocused ? .black : .secondary)
            
            TextField(placeholder, text: $text)
                .focused($isFocused)
               
            if text != "" {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color(.systemGray3))
                    .onTapGesture {
                        withAnimation {
                            self.text = ""
                          }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: size)
        .padding(.horizontal, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: isFocused ? 0.9 : 0.6)
        )
    }
}

#Preview {
    CustomSearchBar(text: .constant(""), placeholder: "search")
}

