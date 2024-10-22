//
//  HomeWireframe.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

class CharactersListWireframe {
    
    func build() -> CharacterListView {
        let repository: CharacterRepositoryProtocol = CharacterRepository(apiClient: apiClient, mapper: mapper)
        let useCase: CharacterListUseCaseProtocol = CharacterListUseCase(repository: repository)
        let viewModel: CharacterListViewModel = CharacterListViewModel(useCase: useCase)
        return CharacterListView(vm: viewModel)
    }
    
    func preview() -> some View {
        build()
    }
    
    private var mapper: CharacterDomainMapper {
        CharacterDomainMapper()
    }
    
    private var apiClient: APIClientProtocol {
        ApiClient()
    }
    
}
