//
//  HomeWireframe.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

class HomeWireframe {
    
    func build() -> HomeView {
        let useCase: HomeUseCaseProtocol = HomeUseCase(apiClient: apiClient)
        let viewModel: HomeViewModel = HomeViewModel(useCase: useCase)
        return HomeView(vm: viewModel)
    }
    
    func preview() -> some View {
        build()
    }
    
    private var apiClient: APIClientProtocol {
        ApiClient()
    }
    
}
