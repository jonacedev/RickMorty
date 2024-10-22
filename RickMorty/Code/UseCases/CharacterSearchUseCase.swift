//
//  SearchCharactersUseCase.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import Foundation

protocol CharacterSearchUseCaseProtocol {
    func searchCharacters(text: String) async throws -> CharactersResponse
}

class CharacterSearchUseCase {
    
    // MARK: - Properties
    
    private var repository: CharacterRepositoryProtocol
    
    // MARK: - Object Lifecycle
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

extension CharacterSearchUseCase: CharacterSearchUseCaseProtocol {
    func searchCharacters(text: String) async throws -> CharactersResponse {
        try await repository.searchCharacters(text: text)
    }
}
