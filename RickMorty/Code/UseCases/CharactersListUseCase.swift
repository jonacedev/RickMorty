//
//  HomeUseCase.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

protocol CharacterListUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse?
    func searchCharacters(text: String) async throws -> CharactersResponse
}

class CharacterListUseCase {
    
    // MARK: - Properties
    
    private var apiClient: APIClientProtocol
    
    // MARK: - Object Lifecycle
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
}

extension CharacterListUseCase: CharacterListUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse? {
        try await apiClient.fetchCharacters(page: page)
    }
    
    func searchCharacters(text: String) async throws -> CharactersResponse {
        return try await apiClient.searchCharacters(text: text)
    }
}
