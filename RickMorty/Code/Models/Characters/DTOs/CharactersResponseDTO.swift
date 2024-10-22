//
//  CharactersModel.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

struct CharactersResponseDTO: Codable {
    let info: InfoModelDTO
    let results: [CharacterModelDTO]
}
