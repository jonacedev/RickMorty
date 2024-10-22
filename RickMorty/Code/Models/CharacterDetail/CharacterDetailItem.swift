//
//  CharacterPresentableItem.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import Foundation
import SwiftUI

struct CharacterDetailItem {
    
    private let character: CharacterModel
    
    init(character: CharacterModel) {
        self.character = character
    }
    
    var imageURL: URL? {
        URL(string: character.imageURL ?? "")
    }
    
    var name: String {
        character.name ?? "character_unknown_placeholder".localized
    }
    
    var aliveStatus: String {
        character.status?.rawValue.capitalized ?? "character_unknown_placeholder".localized
    }
    
    var specie: String {
        character.specie ?? "character_unknown_placeholder".localized
    }
    
    var gender: String {
        character.gender?.rawValue.capitalized ?? "character_unknown_placeholder".localized
    }
    
    var origin: String {
        character.origin?.name ?? "character_unknown_placeholder".localized
    }
    
    var location: String {
        character.location?.name ?? "character_unknown_placeholder".localized
    }
    
    var episodes: [String] {
        character.episodes ?? []
    }
    
    var statusColor: Color {
        switch character.status {
        case .alive: return .green
        case .dead: return .red
        case .unknown: return .gray
        default: return .gray
        }
    }
}
