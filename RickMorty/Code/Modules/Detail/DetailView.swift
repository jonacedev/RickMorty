//
//  DetailView.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @State var vm: DetailViewModel
    let model: CharacterModel
    
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
        WebImage(url: URL(string: model.image ?? ""), options: .retryFailed) { image in
            image.resizable()
        } placeholder: {
            Rectangle().foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 0))
    }
    
    @ViewBuilder private func vwName() -> some View {
        Text(model.name ?? "")
            .font(.largeTitle)
            .bold()
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder private func vwInfoChips() -> some View {
        HStack {
            // Gender
            Label(model.gender.rawValue.capitalized, systemImage: "person")
                .padding(8)
                .fontWeight(.semibold)
                .background(Color.blue.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(10)
            
            // Status (Alive, Dead, Unknown)
            Text(model.status?.rawValue.capitalized ?? "character_unknown_placeholder".localized)
                .padding(8)
                .fontWeight(.semibold)
                .background(model.status == .alive ? Color.green : Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            
            // Specie
            Text(model.species ?? "character_unknown_placeholder".localized)
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
                Text(model.origin?.name ?? "character_unknown_placeholder".localized)
                    .foregroundColor(.secondary)
            }
            
            HStack(alignment: .top, spacing: 5) {
                Text("character_location_title".localized)
                    .bold()
                Text(model.location?.name ?? "character_unknown_placeholder".localized)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    @ViewBuilder private func vwInfoEpisodes() -> some View {
        Text(String(format: NSLocalizedString("character_episodes_title", comment: ""), model.episode?.count ?? 0))
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(model.episode ?? [], id: \.self) { episodeUrl in
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
    DetailWireframe(characterModel: CharacterModel.mock).preview()
}
