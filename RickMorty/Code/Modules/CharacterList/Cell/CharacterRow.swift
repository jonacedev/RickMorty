//
//  CharacterCardView.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterRow: View {
    let character: CharacterModel

    var body: some View {
        VStack {
            WebImage(url: URL(string: character.image ?? ""), options: .retryFailed) { image in
                image.resizable()
            } placeholder: {
                Rectangle().foregroundColor(.gray)
            }
            .scaledToFill()

            Text(character.name ?? "")
                .lineLimit(1)
                .font(.headline)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
                .padding(.bottom, 7)
        }
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 0.3)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CharacterRow(character: CharacterModel.mock)
        .frame(height: 160)
}
