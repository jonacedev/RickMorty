//
//  CharacterListMock.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 21/10/24.
//

import Foundation
@testable import RickMorty

final class CharactersMock {
    
    static func mockCharactersResponseDTO() -> CharactersResponseDTO {
        CharactersResponseDTO(
            info: InfoModelDTO(
                count: 826,
                pages: 42,
                next: "https://rickandmortyapi.com/api/character?page=2",
                prev: nil
            ),
            results: [
                CharacterModelDTO(
                    id: 1,
                    name: "Rick Sanchez",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/1",
                    created: "2017-11-04T18:48:46.250Z"
                ),
                CharacterModelDTO(
                    id: 2,
                    name: "Morty Smith",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/2",
                    created: "2017-11-04T18:50:21.651Z"
                ),
                CharacterModelDTO(
                    id: 3,
                    name: "Summer Smith",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Female",
                    origin: OriginModelDTO(
                        name: "Earth (Replacement Dimension)",
                        url: "https://rickandmortyapi.com/api/location/20"
                    ),
                    location: LocationModelDTO(
                        name: "Earth (Replacement Dimension)",
                        url: "https://rickandmortyapi.com/api/location/20"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/6",
                        "https://rickandmortyapi.com/api/episode/7",
                        "https://rickandmortyapi.com/api/episode/8"
                    ],
                    url: "https://rickandmortyapi.com/api/character/3",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 4,
                    name: "Beth Smith",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Female",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/6",
                        "https://rickandmortyapi.com/api/episode/7",
                        "https://rickandmortyapi.com/api/episode/8"
                    ],
                    url: "https://rickandmortyapi.com/api/character/4",
                    created: "2017-11-04T19:22:43.665Z"
                ),
                CharacterModelDTO(
                    id: 5,
                    name: "Jerry Smith",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/6",
                        "https://rickandmortyapi.com/api/episode/7",
                        "https://rickandmortyapi.com/api/episode/8"
                    ],
                    url: "https://rickandmortyapi.com/api/character/5",
                    created: "2017-11-04T19:26:56.477Z"
                ),
                CharacterModelDTO(
                    id: 6,
                    name: "Abadango Cluster Princess",
                    status: "Alive",
                    species: "Alien",
                    type: "",
                    gender: "Female",
                    origin: OriginModelDTO(
                        name: "Abadango",
                        url: "https://rickandmortyapi.com/api/location/2"
                    ),
                    location: LocationModelDTO(
                        name: "Abadango",
                        url: "https://rickandmortyapi.com/api/location/2"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/6.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/27"
                    ],
                    url: "https://rickandmortyapi.com/api/character/6",
                    created: "2017-11-04T19:50:28.250Z"
                ),
                CharacterModelDTO(
                    id: 7,
                    name: "Abradolf Lincler",
                    status: "Dead",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/7.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/7",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                // Result 8
                CharacterModelDTO(
                    id: 8,
                    name: "Andrew",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/8",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 9,
                    name: "Antenna Morty",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/9.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/9",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 10,
                    name: "Ants in My Eyes Johnson",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/10.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/10",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 11,
                    name: "Arthricia",
                    status: "Alive",
                    species: "Alien",
                    type: "",
                    gender: "Female",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/11.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/11",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 12,
                    name: "Beth's Pet",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/12.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/12",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 13,
                    name: "Birdperson",
                    status: "Alive",
                    species: "Alien",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Bird World",
                        url: "https://rickandmortyapi.com/api/location/4"
                    ),
                    location: LocationModelDTO(
                        name: "Bird World",
                        url: "https://rickandmortyapi.com/api/location/4"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/13.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/13",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 14,
                    name: "Blips and Chitz",
                    status: "Alive",
                    species: "Alien",
                    type: "",
                    gender: "Unknown",
                    origin: OriginModelDTO(
                        name: "Blips and Chitz",
                        url: "https://rickandmortyapi.com/api/location/5"
                    ),
                    location: LocationModelDTO(
                        name: "Blips and Chitz",
                        url: "https://rickandmortyapi.com/api/location/5"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/14.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/14",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 15,
                    name: "Mr. Poopybutthole",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/15.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/15",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 16,
                    name: "Morty Smith",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/16.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/16",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 17,
                    name: "Robo-Rick",
                    status: "Alive",
                    species: "Robot",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/17.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/17",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 18,
                    name: "Rick Sanchez",
                    status: "Alive",
                    species: "Human",
                    type: "Scientist",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/18.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/18",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 19,
                    name: "Summer Smith",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Female",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/19.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/19",
                    created: "2017-11-04T19:09:56.428Z"
                ),
                CharacterModelDTO(
                    id: 20,
                    name: "Jerry Smith",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/20.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/20",
                    created: "2017-11-04T19:09:56.428Z"
                )
            ]
        )
    }
    
    static func mockSearchCharactersResponseDTO() -> CharactersResponseDTO {
        CharactersResponseDTO(
            info: InfoModelDTO(
                count: 826,
                pages: 42,
                next: "https://rickandmortyapi.com/api/character?page=2",
                prev: nil
            ),
            results: [
                CharacterModelDTO(
                    id: 1,
                    name: "Rick Sanchez",
                    status: "Alive",
                    species: "Human",
                    type: "",
                    gender: "Male",
                    origin: OriginModelDTO(
                        name: "Earth (C-137)",
                        url: "https://rickandmortyapi.com/api/location/1"
                    ),
                    location: LocationModelDTO(
                        name: "Citadel of Ricks",
                        url: "https://rickandmortyapi.com/api/location/3"
                    ),
                    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                    episode: [
                        "https://rickandmortyapi.com/api/episode/1",
                        "https://rickandmortyapi.com/api/episode/2",
                        "https://rickandmortyapi.com/api/episode/3"
                    ],
                    url: "https://rickandmortyapi.com/api/character/1",
                    created: "2017-11-04T18:48:46.250Z"
                )
            ]
        )
    }
    
    static func mockCharactersResponse() -> CharactersResponse {
        return CharactersResponse(
            characters: [
                CharacterModel(id: 1,
                               name: "Rick Sanchez",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/1"]),
                
                CharacterModel(id: 2,
                               name: "Morty Smith",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/2"]),
                
                CharacterModel(id: 3,
                               name: "Summer Smith",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .female,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/3"]),
                
                CharacterModel(id: 4,
                               name: "Beth Smith",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .female,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/4.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/4"]),
                
                CharacterModel(id: 5,
                               name: "Jerry Smith",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/5.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/5"]),
                
                CharacterModel(id: 6,
                               name: "Mr. Meeseeks",
                               status: .alive,
                               specie: "Alien",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Unknown", url: ""),
                               location: LocationModel(name: "Unknown", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/6.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/6"]),
                
                CharacterModel(id: 7,
                               name: "Birdperson",
                               status: .alive,
                               specie: "Birdperson",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Bird World", url: ""),
                               location: LocationModel(name: "Bird World", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/7.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/7"]),
                
                CharacterModel(id: 8,
                               name: "Squanchy",
                               status: .alive,
                               specie: "Cat",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Squanchy Planet", url: ""),
                               location: LocationModel(name: "Squanchy Planet", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/8.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/8"]),
                
                CharacterModel(id: 9,
                               name: "Evil Morty",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Unknown", url: ""),
                               location: LocationModel(name: "Unknown", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/9.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/9"]),
                
                CharacterModel(id: 10,
                               name: "Mr. Poopybutthole",
                               status: .alive,
                               specie: "Unknown",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Unknown", url: ""),
                               location: LocationModel(name: "Unknown", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/10.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/10"]),
                
                CharacterModel(id: 11,
                               name: "Jessica",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .female,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/11.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/11"]),
                
                CharacterModel(id: 12,
                               name: "Tammy",
                               status: .dead,
                               specie: "Human",
                               type: "",
                               gender: .female,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/12.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/12"]),
                
                CharacterModel(id: 13,
                               name: "Principal Vagina",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               location: LocationModel(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/13.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/13"]),
                
                CharacterModel(id: 14,
                               name: "Scary Terry",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Nightmare", url: ""),
                               location: LocationModel(name: "Nightmare", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/14.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/14"]),
                
                CharacterModel(id: 15,
                               name: "Ice-T",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Earth (C-137)", url: ""),
                               location: LocationModel(name: "Earth (C-137)", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/15.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/15"]),
                
                CharacterModel(id: 16,
                               name: "Fart",
                               status: .dead,
                               specie: "Unknown",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Unknown", url: ""),
                               location: LocationModel(name: "Unknown", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/16.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/16"]),
                CharacterModel(id: 17,
                               name: "Kyle",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Earth (C-137)", url: ""),
                               location: LocationModel(name: "Earth (C-137)", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/17.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/17"]),
                
                CharacterModel(id: 18,
                               name: "Evil Morty",
                               status: .alive,
                               specie: "Human",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Unknown", url: ""),
                               location: LocationModel(name: "Unknown", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/18.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/18"]),
                
                CharacterModel(id: 19,
                               name: "Boopee",
                               status: .alive,
                               specie: "Unknown",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Unknown", url: ""),
                               location: LocationModel(name: "Unknown", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/19.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/19"]),
                
                CharacterModel(id: 20,
                               name: "Pencilvester",
                               status: .alive,
                               specie: "Unknown",
                               type: "",
                               gender: .male,
                               origin: OriginModel(name: "Unknown", url: ""),
                               location: LocationModel(name: "Unknown", url: ""),
                               imageURL: "https://rickandmortyapi.com/api/character/avatar/20.jpeg",
                               episodes: ["https://rickandmortyapi.com/api/episode/20"])
            ],
            count: 826,
            pages: 42,
            next: "https://rickandmortyapi.com/api/character?page=2",
            prev: nil
        )
    }
}
