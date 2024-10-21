//
//  RickMortyApp.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

@main
struct RickMortyApp: App {
    
    @State var splashFinished: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if splashFinished {
                NavigationStack {
                    CharactersListWireframe().build()
                }
                .tint(.black)
            } else {
                SplashView(splashFinished: $splashFinished)
            }
        }
    }
}
