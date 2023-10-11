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
                backgroundImageView(imageName: "gym_loginBg")
                VStack(spacing: CGFloat(GridPoints.x3)) {
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
                            Color.indigo.opacity(0.5),
                            Color.black.opacity(0.9)]
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
        ).padding(.horizontal, GridPoints.x6).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        CustomTextField(
            textInput: $loginViewAdapter.passwordInput,
            title: loginViewAdapter.passwordPlaceHolder,
            onPress: {
                
            }
        ).padding(.horizontal, GridPoints.x6)
    }
    
    @ViewBuilder private var buttonsView: some View {
        
        NavigationLink(destination: HomeView(), label: {
            SharedBtnStyle(title: "Login")
        })
        .padding(.horizontal, GridPoints.x8)
        
        NavigationLink(destination: SignUpView(), label: {
           SharedBtnStyle(title: "Sign Up")
        })
        .padding(.horizontal, GridPoints.x8)
    }

    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
    
}
