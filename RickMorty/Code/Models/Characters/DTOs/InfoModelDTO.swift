//
//  Info.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

struct InfoModelDTO: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
