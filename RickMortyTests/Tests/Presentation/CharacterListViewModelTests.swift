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
        vm = .init(
            useCase: CharacterListUseCase(
                repository: CharacterRepository(
                    apiClient: NetworkMockSuccess(),
                    mapper: CharacterDomainMapper()
                )
            )
        )
        
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
        vm = .init(
            useCase: CharacterListUseCase(
                repository: CharacterRepository(
                    apiClient: NetworkMockSuccess(),
                    mapper: CharacterDomainMapper()
                )
            )
        )
        
        // Act
        let exp = expectation(description: "wait for completion")
        
        Task {
            await vm.fetchCharacters()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5)
        
        // Assert
        XCTAssertFalse(vm.isLoading)
        XCTAssertNil(vm.errorAlert)
        XCTAssertEqual(vm.characters.count, 20)
    }
    
    func testLoadCharactersFailure() {
        // Arrange
        vm = .init(
            useCase: CharacterListUseCase(
                repository: CharacterRepository(
                    apiClient: NetworkMockFailed(),
                    mapper: CharacterDomainMapper()
                )
            )
        )
        
        // Act
        let exp = expectation(description: "wait for completion")
        
        Task {
            await vm.fetchCharacters()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
        
        // Assert
        XCTAssertNotNil(vm.errorAlert)
        XCTAssertFalse(vm.isLoading)
        XCTAssertEqual(vm.characters.count, 0)
    }
}
