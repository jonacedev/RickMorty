//
//  File.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//
import Foundation

extension URL {
    func appending(queryParameters: [String: String]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        components.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url!
    }
}
