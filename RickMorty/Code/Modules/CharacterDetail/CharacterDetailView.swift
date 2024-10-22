//
//  DetailView.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetailView: View {
    
    @State var vm: CharacterDetailViewModel
    let character: CharacterDetailItem
    
    var body: some View {
        BaseView(content: content, vm: vm)
            .toolbarRole(.editor)
    }
    
    @ViewBuilder private func content() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                vwImage()
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        vwName()
                        vwInfoChips()
                    }
                    
                    vwOriginLocation()
                    vwInfoEpisodes()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
    
    @ViewBuilder private func vwImage() -> some View {
        WebImage(url: character.imageURL, options: .retryFailed) { image in
            image.resizable()
        } placeholder: {
            Rectangle().foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 0))
    }
    
    @ViewBuilder private func vwName() -> some View {
        Text(character.name)
            .font(.largeTitle)
            .bold()
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder private func vwInfoChips() -> some View {
        HStack {
            Label(character.gender, systemImage: "person")
                .padding(8)
                .fontWeight(.semibold)
                .background(Color.blue.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
            
            Text(character.aliveStatus)
                .padding(8)
                .fontWeight(.semibold)
                .background(character.statusColor)
                .foregroundColor(.white)
                .cornerRadius(10)
            
            Text(character.specie)
                .padding(8)
                .fontWeight(.semibold)
                .background(Color.gray.opacity(0.7))
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
    
    @ViewBuilder private func vwOriginLocation() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(alignment: .top, spacing: 5) {
                Text("character_origin_title".localized)
                    .bold()
                Text(character.origin)
                    .foregroundColor(.secondary)
            }
            
            HStack(alignment: .top, spacing: 5) {
                Text("character_location_title".localized)
                    .bold()
                Text(character.location)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    @ViewBuilder private func vwInfoEpisodes() -> some View {
        Text(String(format: NSLocalizedString("character_episodes_title", comment: ""), character.episodes.count))
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(character.episodes, id: \.self) { episodeUrl in
                    Text(episodeUrl.components(separatedBy: "/").last ?? "")
                        .padding(10)
                        .background(Color.cyan.opacity(0.7))
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    CharacterDetailWireframe(characterModel: CharacterModel.mock).preview()
}
