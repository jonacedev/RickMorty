//
//  DetailWireframe.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 20/10/24.
//

import SwiftUI

class CharacterDetailWireframe {
    
    let characterModel: CharacterModel
    
    init(characterModel: CharacterModel) {
        self.characterModel = characterModel
    }
    
    func build() -> CharacterDetailView {
        let viewModel: CharacterDetailViewModel = CharacterDetailViewModel()
        return CharacterDetailView(vm: viewModel, model: characterModel)
    }
    
    func preview() -> some View {
        build()
    }
    
    private var apiClient: APIClientProtocol {
        ApiClient()
    }
    
}
