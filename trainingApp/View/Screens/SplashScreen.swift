//
//  SplashScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-13.
//

import SwiftUI

struct SplashScreen: View {
    @State private var selected: Bool = false
    
    
    var body: some View {
        content
    }
    
    @ViewBuilder private var content: some View {
        ZStack {
            backgroundImageView(imageName: "gym_loginBg")
            VStack() {
                splashLogo()
            }
        }
    }
    
    @ViewBuilder private func backgroundImageView(imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.bottom)
            .overlay(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color.indigo.opacity(0.5),
                            Color.black.opacity(0.9)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.bottom)
            )
    }
    
    struct splashLogo: View {
        
        @State private var selected: Bool = false
        
        var body: some View {
            
            ZStack {
                Image(.swiftui128X128)
                    .scaleEffect(selected ? 1.5 : 1.0)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            selected.toggle()
                        }
                    }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
