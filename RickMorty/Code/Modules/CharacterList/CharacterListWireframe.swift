//
//  HomeWireframe.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

class CharactersListWireframe {
    
    func build() -> CharacterListView {
        let repository = CharacterRepository(apiClient: apiClient, mapper: mapper)
        let fetchUseCase = GetCharacterListUseCase(repository: repository)
        let searchUseCase = CharacterSearchUseCase(repository: repository)
        
        let viewModel: CharacterListViewModel = CharacterListViewModel(fetchUseCase: fetchUseCase, searchUseCase: searchUseCase)
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
