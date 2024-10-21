//
//  ErrorType.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//


import Foundation

enum BaseError: Error {
    case generic
    case notFound
    case apiError(ErrorResponse?, Int?)
}
