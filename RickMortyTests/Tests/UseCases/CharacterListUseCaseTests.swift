//
//  RickMortyTests.swift
//  RickMortyTests
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import XCTest
@testable import RickMorty

final class CharacterListUseCaseTests: XCTestCase {
    
    var useCase: GetCharacterListUseCase!
    
    override func setUp() {
        super.setUp()
        useCase = nil
    }
    
    override func tearDown() {
        useCase = nil
        super.tearDown()
    }
    
    func testFetchCharactersSuccess() async throws {
        // Arrange
        useCase = .init(
            GetCharacterListUseCase(
                repository: CharacterRepository(
                    apiClient: NetworkMockSuccess(),
                    mapper: MockCharacterDomainMapper()
                )
            )
        )
        
        do {
            // Act
            let result = try await useCase.fetchCharacters(page: 1)
            let characters = result.characters
            
            // Assert
            XCTAssertFalse(characters.isEmpty, "Expected non-empty character list")
            XCTAssertEqual(1, characters.first?.id, "First id should be 1")
        } catch {
            XCTFail("Expected success, but got error: \(error.localizedDescription)")
        }
    }
    
    func testFetchCharactersFailed() async throws {
        // Arrange
        useCase = .init(
            GetCharacterListUseCase(
                repository: CharacterRepository(
                    apiClient: NetworkMockFailed(),
                    mapper: MockCharacterDomainMapper()
                )
            )
        )
        
        do {
            // Act
            _ = try await useCase.fetchCharacters(page: 1)
            XCTFail("Expected failure, but succeeded")
        } catch {
            if let baseError = error as? BaseError {
                switch baseError {
                case .generic, .notFound, .apiError:
                    XCTAssertTrue(true)
                }
            } else {
                XCTFail("Expected Base Error")
            }
        }
    }
}
