//
//  HomeUseCase.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

protocol CharacterListUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse
    func searchCharacters(text: String) async throws -> CharactersResponse
}

class CharacterListUseCase {
    
    // MARK: - Properties
    
    private var repository: CharacterRepositoryProtocol
    
    // MARK: - Object Lifecycle
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

extension CharacterListUseCase: CharacterListUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse {
        try await repository.fetchCharacters(page: page)
    }
    
    func searchCharacters(text: String) async throws -> CharactersResponse {
        try await repository.searchCharacters(text: text)
    }
}
