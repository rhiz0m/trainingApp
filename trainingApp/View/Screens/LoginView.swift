//
//  login.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct LoginView: View {
    
    @State private var loginViewAdapter: LoginViewAdapterer = LoginViewAdapter()
    
    var body: some View {
        content
    }
    
    @ViewBuilder private var content: some View {
        ZStack {
            backgroundImageView(imageName: "gym")
            VStack(spacing: CGFloat(GridPoints.x4)) {
                textFieldsView
                buttonsView
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
                            Color.indigo.opacity(0.3),
                            Color.black.opacity(0.6)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.bottom)
            )
    }
    
    @ViewBuilder private var textFieldsView: some View {
        CustomTextField(
            textInput: $loginViewAdapter.emailInput,
            title: loginViewAdapter.emailPlaceHolder,
            onPress: {
                
            }
        ).padding(.horizontal, GridPoints.x6)
        CustomTextField(
            textInput: $loginViewAdapter.passwordInput,
            title: loginViewAdapter.passwordPlaceHolder,
            onPress: {
                
            }
        ).padding(.horizontal, GridPoints.x6)
    }
    
    @ViewBuilder private var buttonsView: some View {
        PrimaryBtn(
            //width: 275, // will not be needed thanks to padding
            title: "Login",
            onPress: {
                
            }
        )
        .padding(.horizontal, GridPoints.x4)
        
        Text("Sign Up").foregroundColor(.white)
            .padding()
            .background(Color.clear)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom).padding()
            .onTapGesture {
                // Tap gesture för att lyssna på vad som händer om man trycker på den
            }
    }
    
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    
}
