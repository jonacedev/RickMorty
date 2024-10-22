//
//  HomeViewModel.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

@Observable
class CharacterListViewModel: BaseViewModel {
    
    @ObservationIgnored private var fetchUseCase: GetCharacterListUseCaseProtocol
    @ObservationIgnored private var searchUseCase: CharacterSearchUseCaseProtocol
    @ObservationIgnored private var currentPage = 1
    @ObservationIgnored private var hasMorePages = true
    
    var characters: [CharacterModel] = []
    var searchText: String = ""
    
    init(fetchUseCase: GetCharacterListUseCaseProtocol, searchUseCase: CharacterSearchUseCaseProtocol) {
        self.fetchUseCase = fetchUseCase
        self.searchUseCase = searchUseCase
    }
    
    @MainActor
    func fetchCharacters() async {
        guard !isLoading && hasMorePages else { return }
        isLoading = true
        
        do {
            let response = try await fetchUseCase.fetchCharacters(page: currentPage)
            let newCharacters = response.characters
            characters.append(contentsOf: newCharacters)
            hasMorePages = (response.next != nil)
            currentPage += 1
            isLoading = false
        } catch {
            handleError(error)
        }
        
    }
    
    @MainActor
    func resetCharacters() async {
        characters.removeAll()
        currentPage = 1
        hasMorePages = true
        notFound = false
        searchText = ""
        await fetchCharacters()
    }
    
    @MainActor
    private func performSearch() async {
        isLoading = true
        do {
            let response = try await searchUseCase.searchCharacters(text: searchText)
            characters = response.characters
            notFound = false
            isLoading = false
        } catch {
            handleError(error)
        }
    }
    
    func checkSearch() async {
        guard !searchText.isEmpty else {
            await resetCharacters()
            return
        }
        await performSearch()
    }

    func hasReachedEnd(id: Int) -> Bool {
        characters.last?.id == id
    }
}
