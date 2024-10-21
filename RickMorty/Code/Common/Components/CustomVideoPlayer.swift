//
//  CustomVideoPlayer.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 20/10/24.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: View {
    
    let avPlayer: AVPlayer
    let finishAction: () -> Void
    
    init(url: URL, finishAction: @escaping () -> Void) {
        self.avPlayer = AVPlayer(url: url)
        self.finishAction = finishAction
    }
    
    var body: some View {
        VideoPlayer(player: avPlayer)
            .ignoresSafeArea()
            .scaledToFill()
            .onAppear() {
                configPlayer()
            }
    }
    
    private func configPlayer() {
        avPlayer.play()
        avPlayer.actionAtItemEnd = .pause
        
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: avPlayer.currentItem,
            queue: .main
        ) { _ in
            videoDidFinish()
        }
    }
    
    
    private func videoDidFinish() {
        finishAction()
    }
}

#Preview {
    CustomVideoPlayer(url: Bundle.main.url(forResource: "rickmorty", withExtension: "mp4")!, finishAction: {})
}
