//
//  CharacterSearchUseCaseTests.swift
//  RickMortyTests
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//

import XCTest
@testable import RickMorty

final class CharacterSearchUseCaseTests: XCTestCase {
    
    var useCase: CharacterSearchUseCase!
    
    override func setUp() {
        super.setUp()
        useCase = nil
    }
    
    override func tearDown() {
        useCase = nil
        super.tearDown()
    }
    
    func testSearchCharacterSuccess() async throws {
        // Arrange
        useCase = .init(
            CharacterSearchUseCase(
                repository: CharacterRepository(
                    apiClient: NetworkMockSuccess(),
                    mapper: MockCharacterDomainMapper()
                )
            )
        )
        
        do {
            // Act
            let searchText = "Rick Sanchez"
            let result = try await useCase.searchCharacters(text: searchText)
            let characters = result.characters
            
            // Assert
            XCTAssertFalse(characters.isEmpty, "Expected non-empty character list")
            XCTAssertTrue(characters.contains(where: { $0.name == searchText }))
        } catch {
            XCTFail("Expected success, but got error: \(error.localizedDescription)")
        }
    }
    
    func testSearchCharacterReturnsNotFound() async {
        // Arrange
        useCase = .init(
            CharacterSearchUseCase(
                repository: CharacterRepository(
                    apiClient: NetworkMockFailed(),
                    mapper: MockCharacterDomainMapper()
                )
            )
        )
        
        do {
            // Act
            let searchText = "Rick Sanchez"
            _ = try await useCase.searchCharacters(text: searchText)
            XCTFail("Expected failure, but succeeded")
        } catch {
            if let baseError = error as? BaseError {
                switch baseError {
                case .notFound:
                    XCTAssertTrue(true)
                default:
                    XCTFail("Expected not found error")
                }
            } else {
                XCTFail("Expected Base Error")
            }
        }
    }
}

