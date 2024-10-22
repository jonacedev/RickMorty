//
//  CharacterRepositoryTest.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//


import XCTest
@testable import RickMorty

final class CharacterRepositoryTests: XCTestCase {

    var repository: CharacterRepository!
    
    override func setUp() {
        super.setUp()
        repository = nil
    }
    
    override func tearDown() {
        repository = nil
        super.tearDown()
    }
    
    func testFetchCharactersSuccess() async {
        // Arrange
        repository = .init(
            CharacterRepository(
                apiClient: NetworkMockSuccess(),
                mapper: CharacterDomainMapper()
            )
        )
        
        do {
            // Act
            let result = try await repository.fetchCharacters(page: 1)
            let characters = result.characters
            let firstCharacter = characters.first?.name
            let expectedCharacter = "Rick Sanchez"
            
            // Assert
            XCTAssertFalse(characters.isEmpty, "Expected non-empty character list")
            XCTAssertEqual(1, characters.first?.id, "First id should be 1")
            XCTAssertEqual(firstCharacter, expectedCharacter)
        } catch {
            XCTFail("Expected success, but got error: \(error.localizedDescription)")
        }
    }
    
    func testFetchCharactersFailed() async {
        // Arrange
        repository = .init(
            CharacterRepository(
                apiClient: NetworkMockFailed(),
                mapper: CharacterDomainMapper()
            )
        )
        
        do {
            // Act
            _ = try await repository.fetchCharacters(page: 1)
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
    
    func testSearchCharacterSuccess() async throws {
        // Arrange
        repository = .init(
            CharacterRepository(
                apiClient: NetworkMockSuccess(),
                mapper: CharacterDomainMapper()
            )
        )
       
        do {
            // Act
            let searchText = "Rick Sanchez"
            let result = try await repository.searchCharacters(text: searchText)
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
        repository = .init(
            CharacterRepository(
                apiClient: NetworkMockFailed(),
                mapper: CharacterDomainMapper()
            )
        )
        
        do {
            // Act
            let searchText = "Rick Sanchez"
            _ = try await repository.searchCharacters(text: searchText)
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
