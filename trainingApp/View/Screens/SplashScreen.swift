//
//  SplashScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-13.
//

import SwiftUI

struct SplashScreen: View {
    @State private var animationCompleted: Bool = false

    
    var body: some View {
        content
    }
    
    @ViewBuilder private var content: some View {
        ZStack {
           // backgroundImageView(imageName: "gymEquip")
            VStack {
                SplashLogo(animationCompleted: $animationCompleted)
            }
        }
    }
    
/*    @ViewBuilder private func backgroundImageView(imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .edgesIgnoringSafeArea(.bottom)
            .overlay(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            CustomColors.cyan.opacity(0.08),
                            Color.black.opacity(0.7)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.bottom)
            )
    } */
}

struct SplashLogo: View {
    
    @Binding var animationCompleted: Bool
    
    var body: some View {
        ZStack {
            if !animationCompleted {
                splashText
                    .opacity(animationCompleted ? 0 : 1)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation() {
                                animationCompleted = true
                            }
                        }
                    }
            } else {
                HomeView()
            }
        }
        .transition(.opacity)
    }
    
    private var splashText: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 250, height: 250)
                .scaledToFit()
                .cornerRadius(30)
            
            HStack(spacing: 0) {
                ForEach(Array("S T R E N G T H ◄ ► C A M P")
                        , id: \.self) { char in
                    Text(String(char))
                        .bold()
                        .italic()
                        .font(Font.custom("San Francisco", size: 12)  )
                        .foregroundColor(.black)
                        .opacity(charOpacity[char] ?? 0)
                        .animation(
                            Animation.easeIn(duration: 0.5)
                        )
                        .onAppear {
                            withAnimation {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    charOpacity[char] = 1
                                }
                            }
                        }
                }
            }
        }
    }

    @State private var charOpacity: [Character: Double] = [:]

}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
