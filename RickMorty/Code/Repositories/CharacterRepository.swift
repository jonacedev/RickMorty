//
//  CharacterRepositoryProtocol.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse
    func searchCharacters(text: String) async throws -> CharactersResponse
}

final class CharacterRepository: CharacterRepositoryProtocol {
    private let apiClient: APIClientProtocol
    private let mapper: CharacterDomainMapper

    init(apiClient: APIClientProtocol, mapper: CharacterDomainMapper) {
        self.apiClient = apiClient
        self.mapper = mapper
    }

    func fetchCharacters(page: Int) async throws -> CharactersResponse {
        let dto: CharactersResponseDTO = try await apiClient.fetchCharacters(page: page)
        return mapper.mapToCharactersResponse(from: dto)
    }

    func searchCharacters(text: String) async throws -> CharactersResponse {
        let dto: CharactersResponseDTO = try await apiClient.searchCharacters(text: text)
        return mapper.mapToCharactersResponse(from: dto)
    }
}
