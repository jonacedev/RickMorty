//
//  Character.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

struct CharacterModel: Codable, Hashable {
    let id: Int
    let name: String?
    let status: CharacterStatus?
    let species: String?
    let type: String?
    let gender: CharacterGender
    let origin: OriginModel?
    let location: LocationModel?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    // MARK: Mock data for preview
    static let mock = CharacterModel(
        id: 1,
        name: "Rick Sanchez",
        status: .alive,
        species: "Human",
        type: "",
        gender: .male,
        origin: OriginModel(name: "Earth", url: ""),
        location: LocationModel(name: "Earth", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: ["https://rickandmortyapi.com/api/episode/1"],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    )
}
