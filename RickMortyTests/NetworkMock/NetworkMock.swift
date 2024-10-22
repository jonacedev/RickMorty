//
//  HTTPClientMockCharacterListSuccess.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 21/10/24.
//

import Foundation
@testable import RickMorty

final class NetworkMockSuccess: APIClientProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse {
        let data = CharacterListMock.jsonDataResponse()
        return try JSONDecoder().decode(CharactersResponse.self, from: data)
    }
    
    func searchCharacters(text: String) async throws -> CharactersResponse {
        let data = CharacterListMock.jsonSearchDataResponse()
        return try JSONDecoder().decode(CharactersResponse.self, from: data)
    }
}

final class NetworkMockFailed: APIClientProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponse {
        throw BaseError.generic
    }
    
    func searchCharacters(text: String) async throws -> CharactersResponse {
        throw BaseError.notFound
    }
}
