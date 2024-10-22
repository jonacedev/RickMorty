//
//  CharacterPresentableItemTests.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//


import XCTest
@testable import RickMorty

final class CharacterDetailItemTests: XCTestCase {
    
    func testCharacterDetailInit() {
        let character = CharacterModel(
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
        
        let presentableItem = CharacterDetailItem(character: character)
        
        XCTAssertEqual(presentableItem.name, "Rick Sanchez")
        XCTAssertEqual(presentableItem.origin, "Earth")
        XCTAssertEqual(presentableItem.aliveStatus, "Alive")
        XCTAssertEqual(presentableItem.specie, "Human")
        XCTAssertEqual(presentableItem.statusColor, .green)
    }
    
    func testImageURLWithValidURL() {
        let character = CharacterModel(
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
        let presentableItem = CharacterDetailItem(character: character)
        let imageURL = presentableItem.imageURL
        
        XCTAssertEqual(imageURL, URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        XCTAssertTrue(UIApplication.shared.canOpenURL(presentableItem.imageURL!))
    }
    
    func testImageURLWithInvalidURL() {
        let character = CharacterModel(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            specie: "Human",
            type: "",
            gender: .male,
            origin: OriginModel(name: "Earth", url: ""),
            location: LocationModel(name: "Earth", url: ""),
            imageURL: "default_url",
            episodes: ["https://rickandmortyapi.com/api/episode/1"]
        )
        
        let presentableItem = CharacterDetailItem(character: character)
        
        XCTAssertFalse(UIApplication.shared.canOpenURL(presentableItem.imageURL!))
    }
    
    func testStatusColorNotAlive() {
        let character = CharacterModel(
            id: 1,
            name: "Rick Sanchez",
            status: .dead,
            specie: "Human",
            type: "",
            gender: .male,
            origin: OriginModel(name: "Earth", url: ""),
            location: LocationModel(name: "Earth", url: ""),
            imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episodes: ["https://rickandmortyapi.com/api/episode/1"]
        )
        
        let presentableItem = CharacterDetailItem(character: character)
        let statusColor = presentableItem.statusColor
        
        XCTAssertEqual(statusColor, .red)
    }
    
    func testStatusColorAlive() {
        let character = CharacterModel(
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
        
        let presentableItem = CharacterDetailItem(character: character)
        let statusColor = presentableItem.statusColor
        
        XCTAssertEqual(statusColor, .green)
    }
}
