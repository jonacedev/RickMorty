//
//  Character.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

struct CharacterModelDTO: Codable {
    let id: Int
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: OriginModelDTO?
    let location: LocationModelDTO?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct OriginModelDTO: Codable {
    let name: String
    let url: String
}

struct LocationModelDTO: Codable {
    let name: String
    let url: String
}
