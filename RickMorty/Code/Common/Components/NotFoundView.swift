//
//  NotFoundBox.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 20/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct NotFoundView: View {
    let title: String
    @State private var isAnimating: Bool = false
    
    init(title: String = "error_not_found".localized) {
        self.title = title
    }
    
    var body: some View {
        VStack(spacing: 20) {
            if let gifPath = Bundle.main.path(forResource: "notfound", ofType: "gif") {
                AnimatedImage(url: URL(fileURLWithPath: gifPath))
                    .playbackMode(.bounce)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Text(title)
                .foregroundStyle(.black)
                .font(.system(size: 20, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeInOut(duration: 0.4), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    NotFoundView()
}


