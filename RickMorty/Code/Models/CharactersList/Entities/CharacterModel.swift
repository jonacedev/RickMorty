//
//  CharacterModelDTO.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import Foundation

struct CharacterModel: Codable, Hashable {
    let id: Int
    let name: String?
    let status: CharacterStatus?
    let specie: String?
    let type: String?
    let gender: CharacterGender?
    let origin: OriginModel?
    let location: LocationModel?
    let imageURL: String?
    let episodes: [String]?
    
    // MARK: Mock data for preview
    static let mock = CharacterModel(
        id: 1,
        name: "Rick Sanchez",
        status: .alive,
        specie: "Human",
        type: "",
        gender: .male,
        origin: OriginModel(name: "Earth", url: ""),
        location: LocationModel(name: "Earth", url: ""),
        imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episodes: ["https://rickandmortyapi.com/api/episode/1"]
    )
}
