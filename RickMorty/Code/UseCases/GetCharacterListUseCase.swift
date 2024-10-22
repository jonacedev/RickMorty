//
//  HomeUseCase.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

protocol GetCharacterListUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse
}

class GetCharacterListUseCase {
    
    // MARK: - Properties
    
    private var repository: CharacterRepositoryProtocol
    
    // MARK: - Object Lifecycle
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
}

extension GetCharacterListUseCase: GetCharacterListUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse {
        try await repository.fetchCharacters(page: page)
    }
}
