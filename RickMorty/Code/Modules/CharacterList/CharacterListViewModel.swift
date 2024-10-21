//
//  HomeViewModel.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

@Observable
class CharacterListViewModel: BaseViewModel {
    
    @ObservationIgnored private var useCase: CharacterListUseCaseProtocol
    @ObservationIgnored private var currentPage = 1
    @ObservationIgnored private var hasMorePages = true
    
    var characters: [CharacterModel] = []
    var searchText: String = ""
    
    init(useCase: CharacterListUseCaseProtocol) {
        self.useCase = useCase
    }
    
    @MainActor func fetchCharacters() async {
        guard !loading && hasMorePages else { return }
        loading = true
        
        do {
            let response = try await useCase.fetchCharacters(page: currentPage)
            if let newCharacters = response?.results {
                characters.append(contentsOf: newCharacters)
            }
            hasMorePages = (response?.info.next != nil)
            currentPage += 1
            loading = false
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
    
    @MainActor private func performSearch() async {
        loading = true
        do {
            let response = try await useCase.searchCharacters(text: searchText)
            characters = response.results
            notFound = false
            loading = false
        } catch {
            handleError(error)
        }
    }
    
    @MainActor func resetCharacters() async {
        characters.removeAll()
        currentPage = 1
        hasMorePages = true
        notFound = false
        searchText = ""
        await fetchCharacters()
    }
    
    func hasReachedEnd(id: Int) -> Bool {
        characters.last?.id == id
    }
}
