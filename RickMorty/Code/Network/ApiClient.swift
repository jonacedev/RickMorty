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
        
        do {
            let response: CharactersResponseDTO? = try await self.request(requestModel: requestModel)
            guard let response else { throw BaseError.generic }
            return response
            
        } catch {
            throw error
        }
    }
    
    func searchCharacters(text: String) async throws -> CharactersResponseDTO {
        let requestModel = RequestModel(
            path: .characters,
            method: .get,
            queryParameters: ["name": text]
        )
        
        do {
            let response: CharactersResponseDTO? = try await self.request(requestModel: requestModel)
            guard let response else { throw BaseError.generic }
            return response
            
        } catch {
            throw error
        }
    }
    
}
