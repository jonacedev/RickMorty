//
//  CharacterListViewModelTests.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 22/10/24.
//


import XCTest
@testable import RickMorty

class CharacterListViewModelTests: XCTestCase {
    
    var vm: CharacterListViewModel!
    
    override func setUp() {
        super.setUp()
        vm = nil
    }
    
    override func tearDown() {
        vm = nil
        super.tearDown()
    }
        
    func testLoadCharactersHideLoader() {
        // Arrange
        let mockApiClient = NetworkMockSuccess()
        vm = setViewModel(apiClient: mockApiClient)
        
        // Act
        Task {
            await vm.fetchCharacters()
        }
        
        // Assert
        XCTAssertFalse(vm.isLoading)
        XCTAssertNil(vm.errorAlert)
    }
    
    func testLoadCharactersUpdatesUIWhenLoadingFinish() {
        // Arrange
        let mockApiClient = NetworkMockSuccess()
        vm = setViewModel(apiClient: mockApiClient)
        
        // Act
        let exp = expectation(description: "wait for completion")
        
        Task {
            await vm.fetchCharacters()
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
        
        // Assert
        XCTAssertFalse(vm.isLoading)
        XCTAssertNil(vm.errorAlert)
        XCTAssertEqual(vm.characters.count, 20)
    }
    
    func testLoadCharactersFailure() {
        // Arrange
        let mockApiClient = NetworkMockFailed()
        vm = setViewModel(apiClient: mockApiClient)
        
        // Act
        let exp = expectation(description: "wait for completion")
        
        Task {
            await vm.fetchCharacters()
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
        
        // Assert
        XCTAssertNotNil(vm.errorAlert)
        XCTAssertFalse(vm.isLoading)
        XCTAssertEqual(vm.characters.count, 0)
    }
    
    private func setViewModel(apiClient: APIClientProtocol) -> CharacterListViewModel {
        return CharacterListViewModel(
            fetchUseCase: GetCharacterListUseCase(
                repository: CharacterRepository(
                    apiClient: apiClient,
                    mapper: MockCharacterDomainMapper()
                )
            ), searchUseCase: CharacterSearchUseCase(
                repository: CharacterRepository(
                    apiClient: apiClient,
                    mapper: MockCharacterDomainMapper()
                )
            )
        )
    }
}
