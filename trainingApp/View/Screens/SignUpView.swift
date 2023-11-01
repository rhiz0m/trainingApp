//
//  SignUp.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var database: DbViewModel
    @ObservedObject var authViewAdapter: AuthViewAdapter
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
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
            textInput: $email,
            title: authViewAdapter.emailPlaceHolder,
            onPress: {}
        ).padding(.horizontal, GridPoints.x6).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        
        /*  CustomTextField(
         textInput: $authViewAdapter.confirmEmailInput,
         title: authViewAdapter.confirmEmailPlaceHolder,
         onPress: {}
         ).padding(.horizontal, GridPoints.x6) */
        
        CustomTextField(
            textInput: $password,
            title: authViewAdapter.passwordPlaceHolder,
            onPress: {}
        ).padding(.horizontal, GridPoints.x6)
        
        CustomTextField(
            textInput: $confirmPassword,
            title: authViewAdapter.confirmPasswordPlaceHolder,
            onPress: {}
        ).padding(.horizontal, GridPoints.x6)
            .padding(.bottom, GridPoints.x2)
            .padding(.bottom, GridPoints.x2)
        
    }
    
    @ViewBuilder private var buttonsView: some View {
        
        PrimaryBtn(title: "Sign Up", onPress: {
            if !email.isEmpty && !password.isEmpty && password == confirmPassword {
                database.registerUser(email: email, password: password) { success in
                    if success {
                        print("Successfully created account")
                        // You might want to navigate to a different view or perform other actions here
                    } else {
                        print("Failed to create account")
                    }
                }
            }
        })
        .padding(.horizontal, GridPoints.custom(16))
        
        NavigationLink(destination: LoginView(database: database, authViewAdapter: authViewAdapter), label: {
            SharedBtnStyle(title: "Cancel")
        })
        .padding(.horizontal, GridPoints.custom(16))
    }}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(database: DbViewModel(), authViewAdapter: AuthViewAdapter())
    }
}
