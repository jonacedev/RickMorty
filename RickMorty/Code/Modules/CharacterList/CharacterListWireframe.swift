//
//  HomeWireframe.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

class CharactersListWireframe {
    
    func build() -> CharacterListView {
        let useCase: CharacterListUseCaseProtocol = CharacterListUseCase(apiClient: apiClient)
        let viewModel: CharacterListViewModel = CharacterListViewModel(useCase: useCase)
        return CharacterListView(vm: viewModel)
    }
    
    func preview() -> some View {
        build()
    }
    
    private var apiClient: APIClientProtocol {
        ApiClient()
    }
    
}
