//
//  BaseViewModel.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

@Observable
class BaseViewModel {
    
    // MARK: - Properties
    
    var isLoading: Bool = false
    var notFound: Bool = false
    var errorAlert: AlertModel?
    
    @MainActor func showAlert(error: AlertModel) {
        isLoading = false
        errorAlert = error
    }
    
    @MainActor func hideAlert() {
        errorAlert = nil
    }
    
    @MainActor func handleError(_ error: Error) {
        isLoading = false
        notFound = false
        
        if let baseError = error as? BaseError {
            switch baseError {
            case .generic:
                showAlert(error: AlertModel(image: "ic_warning", description: "error_generic".localized, action1: hideAlert))
            case .notFound:
                notFound = true
                break
            case .apiError(let error, _):
                showAlert(error: AlertModel(image: "ic_warning", description: error?.error ?? "error_generic".localized, action1: hideAlert))
            }
        } else {
            showAlert(error: AlertModel(image: "ic_warning", description: "error_generic".localized, action1: hideAlert))
        }
    }
}
