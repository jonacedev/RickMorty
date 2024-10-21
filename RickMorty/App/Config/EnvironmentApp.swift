//
//  EnvironmentApp.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import UIKit

final class EnvironmentApp {

    // MARK: - Constant

    private let typeFileEnvironment = "plist"
    private let keyEnvironmentURL = "baseURL"
    private let nameFileEnvironment = "Config"
    private let isMockKey = "isMock"
    
    // MARK: - Shared Instance

    static let shared = EnvironmentApp()

    // MARK: - Init
    
    private init() {
        
        if let path = Bundle.main.path(forResource: nameFileEnvironment, ofType: typeFileEnvironment) {
            plistEnvironment = NSDictionary(contentsOfFile: path) as? [String: AnyObject]
        }
    }
    
    // MARK: - Properties

    private var plistEnvironment: [String: Any]?

    var baseURL: String {
        guard let baseUrl = plistEnvironment?[keyEnvironmentURL] as? String else { fatalError("Invalid baseURL at plist") }
        return baseUrl
    }
    
    var isMock: Bool {
        guard let valueMock = plistEnvironment?[isMockKey] as? Bool else { fatalError("Invalid isMockKey at plist") }
        return valueMock
    }
    
}
