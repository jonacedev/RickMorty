//
//  ErrorResponse.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//


import Foundation

struct ErrorResponse: Codable {

    /** Error message  */
    var error: String

    init(error: String) {
        self.error = error
    }
}
