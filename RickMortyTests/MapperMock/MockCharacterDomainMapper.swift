//
//  MockCharacterDomainMapper.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import Foundation
@testable import RickMorty

class MockCharacterDomainMapper: CharacterDomainMapper {
    override func mapToCharactersResponse(from dto: CharactersResponseDTO) -> CharactersResponse {
        CharactersMock.mockCharactersResponse()
    }
}
