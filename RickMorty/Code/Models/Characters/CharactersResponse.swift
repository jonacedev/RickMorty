//
//  CharactersModel.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

struct CharactersResponse: Codable {
    let info: InfoModel
    let results: [CharacterModel]
}
