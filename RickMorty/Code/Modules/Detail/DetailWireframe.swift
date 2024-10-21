//
//  DetailWireframe.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 20/10/24.
//

import SwiftUI

class DetailWireframe {
    
    let characterModel: CharacterModel
    
    init(characterModel: CharacterModel) {
        self.characterModel = characterModel
    }
    
    func build() -> DetailView {
        let viewModel: DetailViewModel = DetailViewModel()
        return DetailView(vm: viewModel, model: characterModel)
    }
    
    func preview() -> some View {
        build()
    }
    
    private var apiClient: APIClientProtocol {
        ApiClient()
    }
    
}
