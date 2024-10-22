//
//  CharacterReponseMapper.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import Foundation

class CharacterDomainMapper {
    func mapToCharactersResponse(from dto: CharactersResponseDTO) -> CharactersResponse {
        return CharactersResponse(
            characters: dto.results.map { mapToCharacterModel(from: $0) },
            count: dto.info.count,
            pages: dto.info.pages,
            next: dto.info.next,
            prev: dto.info.prev
        )
    }

    func mapToCharacterModel(from dto: CharacterModelDTO) -> CharacterModel {
        return CharacterModel(
            id: dto.id,
            name: dto.name,
            status: mapToCharacterStatus(from: dto.status),
            specie: dto.species,
            type: dto.type,
            gender: mapToCharacterGender(from: dto.gender),
            origin: mapToOriginModel(from: dto.origin),
            location: mapToLocationModel(from: dto.location),
            imageURL: dto.image,
            episodes: dto.episode
        )
    }

    func mapToOriginModel(from dto: OriginModelDTO?) -> OriginModel? {
        guard let dto = dto else { return nil }
        return OriginModel(name: dto.name, url: dto.url)
    }

    func mapToLocationModel(from dto: LocationModelDTO?) -> LocationModel? {
        guard let dto = dto else { return nil }
        return LocationModel(name: dto.name, url: dto.url)
    }

    // Mapping Enums
    func mapToCharacterStatus(from status: String?) -> CharacterStatus? {
        return CharacterStatus(rawValue: status ?? "")
    }

    func mapToCharacterGender(from gender: String?) -> CharacterGender? {
        return CharacterGender(rawValue: gender ?? "")
    }
}
