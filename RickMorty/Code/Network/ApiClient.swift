//
//  HomeDataManager.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

protocol APIClientProtocol {
    func fetchCharacters(page: Int) async throws -> CharactersResponseDTO
    func searchCharacters(text: String) async throws -> CharactersResponseDTO
}

class ApiClient: BaseAPIClient, APIClientProtocol {
    
    func fetchCharacters(page: Int) async throws -> CharactersResponseDTO {
        let requestModel = RequestModel(
            path: .characters,
            method: .get,
            queryParameters: ["page": String(page)]
        )
        
        return try await self.request(requestModel: requestModel)
    }
    
    func searchCharacters(text: String) async throws -> CharactersResponseDTO {
        let requestModel = RequestModel(
            path: .characters,
            method: .get,
            queryParameters: ["name": text]
        )
        
        return try await self.request(requestModel: requestModel)
    }
    
}
