//
//  HomeView.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

struct CharacterListView: View {
    
    @State var vm: CharacterListViewModel
    @Namespace var namespace
    
    var columns: [GridItem] = [GridItem(.adaptive(minimum: 160))]
    
    var body: some View {
        BaseView(content: content, vm: vm)
            .task {
                if vm.characters.isEmpty {
                    await vm.fetchCharacters()
                }
            }
    }
    
    @ViewBuilder private func content() -> some View {
        
        VStack(spacing: 16) {
            CustomSearchBar(text: $vm.searchText, placeholder: "placeholder_searchbar".localized)
                .padding(.horizontal, 14)
                .onChange(of: vm.searchText) {
                    Task {
                        await vm.checkSearch()
                    }
                }
            
            ScrollView {
                VStack {
                    if vm.notFound {
                        NotFoundView()
                    } else {
                        vwCharactersGrid()
                    }
                }
                .padding(14)
            }
            .refreshable {
                await vm.resetCharacters()
            }
            .redacted(reason: vm.isLoading ? .placeholder: [])
            .scrollDismissesKeyboard(.interactively)
        }
        .padding(.top, 20)
    }
    
    @ViewBuilder private func vwCharactersGrid() -> some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(vm.characters, id: \.id) { character in
                NavigationLink(destination: destinationView(for: character)) {
                    characterRow(for: character)
                }
                .buttonStyle(.plain)
                .task {
                    if vm.hasReachedEnd(id: character.id) {
                        await vm.fetchCharacters()
                    }
                }
            }
        }
    }
    
    @ViewBuilder private func destinationView(for character: CharacterModel) -> some View {
        if #available(iOS 18.0, *) {
            CharacterDetailWireframe(characterModel: character)
                .build()
                .navigationTransition(.zoom(sourceID: character.id, in: namespace))
        } else {
            CharacterDetailWireframe(characterModel: character)
                .build()
        }
    }
    
    @ViewBuilder private func characterRow(for character: CharacterModel) -> some View {
        if #available(iOS 18.0, *) {
            CharacterRow(character: character)
                .scrollTransition(.animated) { content, phase in
                    content
                        .opacity(phase.isIdentity ? 1 : 0.8)
                        .scaleEffect(phase.isIdentity ? 1 : 0.8)
                }
                .matchedTransitionSource(id: character.id, in: namespace)
        } else {
            CharacterRow(character: character)
                .scrollTransition(.animated) { content, phase in
                    content
                        .opacity(phase.isIdentity ? 1 : 0.8)
                        .scaleEffect(phase.isIdentity ? 1 : 0.8)
                }
        }
    }
}

#Preview {
    CharactersListWireframe().preview()
}
