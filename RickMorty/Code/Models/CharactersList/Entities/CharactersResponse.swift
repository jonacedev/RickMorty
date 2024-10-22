//
//  CharactersResponse.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import Foundation

struct CharactersResponse: Codable {
    let characters: [CharacterModel]
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
