//
//  login.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @ObservedObject var db: DbConnection
    @ObservedObject var authViewAdapter: AuthViewAdapter
    
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
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.bottom)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                CustomColors.cyan.opacity(0.35),
                                Color.black.opacity(1)
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.bottom)
                )
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.black, .cyan],
                                                 startPoint: .bottomTrailing, endPoint: .topTrailing))
                .frame(height: 180)
                .rotationEffect(.degrees(175))
                .offset(x: 0, y: 0)
                .padding()
        }
    }

    
    @ViewBuilder private var textFieldsView: some View {
        CustomTextField(
            textInput: $authViewAdapter.emailInput,
            title: authViewAdapter.emailPlaceHolder,
            onPress: {
                
            }
        ).padding(.horizontal, GridPoints.x6).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom).textInputAutocapitalization(.never)
        CustomSecureFeild(
            textInput: $authViewAdapter.passwordInput,
            title: authViewAdapter.passwordPlaceHolder,
            onPress: {
                
            }
        ).padding(.horizontal, GridPoints.x6)
            .padding(.bottom, GridPoints.x2)
    }
    
    @ViewBuilder private var buttonsView: some View {
        
        NavigationLink(destination: HomeView(), label: {
            
            PrimaryBtnStyle(title: "Login",
                            icon: "")
        }
                       
        )
        .padding(.horizontal, GridPoints.custom(16))
        
        NavigationLink(destination: SignUpView(database: db, authViewAdapter: authViewAdapter), label: {
            Text("Sign Up")
                .foregroundStyle(.white)
        })
        .padding(.horizontal, GridPoints.custom(16))
        .padding(.bottom, GridPoints.x2)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {

        LoginView(db: DbConnection(), authViewAdapter: AuthViewAdapter())
    }
}

