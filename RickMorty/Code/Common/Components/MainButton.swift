//
//  SMMainButton.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

struct MainButton: View {
    
    let title: String
    let action: () -> Void
    let height: CGFloat = 44
    let cornerRadius: CGFloat = 10
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .semibold))
                .background(.black)
                .clipShape(.rect(cornerRadius: cornerRadius))
                .shadow(radius: 5)
            })
    }
}

#Preview {
    MainButton(title: "Main Button", action: { })
}
