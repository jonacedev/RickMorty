//
//  SplashView.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 20/10/24.
//

import SwiftUI
import AVKit

struct SplashView: View {
    
    @Binding var splashFinished: Bool
    
    var body: some View {
        if let url = Bundle.main.url(forResource: "rickmorty", withExtension: "mp4") {
            CustomVideoPlayer(url: url, finishAction: {
                splashFinished = true
            })
        }
    }
}

#Preview {
    SplashView(splashFinished: .constant(false))
}
