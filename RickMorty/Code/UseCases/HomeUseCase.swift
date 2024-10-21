//
//  HomeUseCase.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

protocol HomeUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse?
    func searchCharacters(text: String) async throws -> CharactersResponse
}

class HomeUseCase {
    
    // MARK: - Properties
    
    private var apiClient: APIClientProtocol
    
    // MARK: - Object Lifecycle
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
}

extension HomeUseCase: HomeUseCaseProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse? {
        try await apiClient.fetchCharacters(page: page)
    }
    
    func searchCharacters(text: String) async throws -> CharactersResponse {
        return try await apiClient.searchCharacters(text: text)
    }
}
