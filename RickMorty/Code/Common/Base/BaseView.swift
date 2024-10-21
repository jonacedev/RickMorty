//
//  BaseView.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import SwiftUI

struct BaseView<Content: View>: View {

    let content: () -> Content
    var vm: BaseViewModel
    
    var body: some View {
        ZStack {
            content()
            alert()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    @ViewBuilder func alert() -> some View {
        if let alert = vm.errorAlert {
            BaseAlert(model: alert)
        }
    }
    
}
