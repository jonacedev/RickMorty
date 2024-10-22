//
//  RickMortyTests.swift
//  RickMortyTests
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import XCTest
@testable import RickMorty

final class CharacterListUseCaseTests: XCTestCase {
    
    var useCase: CharacterListUseCase!
    
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
        let mockAPIClient = NetworkMockSuccess()
        useCase = CharacterListUseCase(apiClient: mockAPIClient)
        
        do {
            // Act
            let result = try await useCase.fetchCharacters(page: 1)
            let characters = result.results
            
            // Assert
            XCTAssertFalse(characters.isEmpty, "Expected non-empty character list")
            XCTAssertEqual(1, characters.first?.id, "First id should be 1")
        } catch {
            XCTFail("Expected success, but got error: \(error.localizedDescription)")
        }
    }
    
    func testSearchCharacterSuccess() async throws {
        // Arrange
        let mockAPIClient = NetworkMockSuccess()
        useCase = CharacterListUseCase(apiClient: mockAPIClient)
        let searchText = "Rick Sanchez"
        
        do {
            // Act
            let result = try await useCase.searchCharacters(text: searchText)
            let characters = result.results
            
            // Assert
            XCTAssertFalse(characters.isEmpty, "Expected non-empty character list")
            XCTAssertTrue(characters.contains(where: { $0.name == searchText }))
        } catch {
            XCTFail("Expected success, but got error: \(error.localizedDescription)")
        }
    }
    
    func testFetchCharactersFailure() async throws {
        // Arrange
        let mockAPIClient = NetworkMockFailed()
        useCase = CharacterListUseCase(apiClient: mockAPIClient)
        
        // Act
        do {
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
    
    func testSearchCharacterReturnsNotFound() async {
        
        // Arrange
        let mockAPIClient = NetworkMockFailed()
        let useCase = CharacterListUseCase(apiClient: mockAPIClient)
        let searchText = "Rick Sanchez"
        
        // Act
        do {
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
