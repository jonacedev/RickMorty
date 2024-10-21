//
//  BaseAlert.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//


import SwiftUI

struct BaseAlert: View {

    @State var fixedSize = true
    @State var maxHeight: CGFloat = 500
    @State var backOpacity: CGFloat = 0
    let model: AlertModel

    var body: some View {
        ZStack {
            Color.black.opacity(backOpacity)
                .ignoresSafeArea()
                .blur(radius: 0)
            alert()
        }
        .ignoresSafeArea()
        .ignoresSafeArea()
        .onAppear {
            withAnimation {
                backOpacity = 0.4
            }
        }
    }

    @ViewBuilder func alert() -> some View {
        VStack {
            Spacer()
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .clipShape(.rect(cornerRadius: 24))
                VStack(spacing: 12) {

                    if let image = model.image {
                        Image(image).resizable().frame(width: 36, height: 36, alignment: .center).foregroundStyle(.white)
                    }

                    alertTexts()
                    buttons()

                }
                .padding()
            }
            .frame(maxHeight: maxHeight)
            .clipped()
            .fixedSize(horizontal: false, vertical: fixedSize)
        }
    }

    @ViewBuilder func alertTexts() -> some View {
        Text(model.description).font(.body)
            .foregroundStyle(Color.black)
            .multilineTextAlignment(.center)
    }

    @ViewBuilder func buttons() -> some View {
        VStack(spacing: 16) {
            MainButton(title: model.buttonText1) {
                withAnimation {
                    maxHeight = 0
                    backOpacity = 0
                }
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    model.action1()
                }
            }
            
            if let action2 = model.action2 {
                MainButton(title: model.buttonText2) {
                    withAnimation {
                        maxHeight = 0
                        backOpacity = 0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        action2()
                    }
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    BaseAlert(model: AlertModel(image: "ic_launch_logo", description: "Alert", buttonText1: "Button 1", buttonText2: "Button 2",
                                     action1: {},
                                     action2: {}))
}
