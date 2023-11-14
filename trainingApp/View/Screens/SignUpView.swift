//
//  SignUp.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var database: DbConnection
    @ObservedObject var authViewAdapter: AuthViewAdapter

    @State var confirmPassword = ""
    
    var body: some View {
        content
    }
    
    @ViewBuilder private var content: some View {
        ZStack {
            backgroundImageView(imageName: "gym_womanBg")
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
                                CustomColors.magenta.opacity(0.05),
                                Color.black.opacity(1)
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.bottom)
                )
        }
    }
    
    @ViewBuilder private var textFieldsView: some View {
        
        CustomTextField(
            textInput: $authViewAdapter.emailInput,
            title: authViewAdapter.emailPlaceHolder
        ).padding(.horizontal, GridPoints.x8).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        
        CustomTextField(
            textInput: $authViewAdapter.passwordInput,
            title: authViewAdapter.passwordPlaceHolder
        ).padding(.horizontal, GridPoints.x8)
        
        CustomTextField(
            textInput: $confirmPassword,
            title: authViewAdapter.confirmPasswordPlaceHolder
        ).padding(.horizontal, GridPoints.x8)
            .padding(.bottom, GridPoints.x2)
    }
    
    @ViewBuilder private var buttonsView: some View {
        
        Button(action: {
            if !authViewAdapter.emailInput.isEmpty && !authViewAdapter.passwordInput.isEmpty && authViewAdapter.passwordInput == confirmPassword {
                database.registerUser(email: authViewAdapter.emailInput, password: authViewAdapter.passwordInput) { success in
                    if success {
                        print("Successfully created account")
                    } else {
                        print("Failed to create account")
                    }
                }
            }
        }, label: {
            PrimaryBtnStyle(title: "Sign Up", icon: "")
        }).padding(.horizontal, GridPoints.custom(16))
        
        NavigationLink(destination: LoginView(db: database, authViewAdapter: authViewAdapter), label: {
            Text("Cancel")
                .foregroundStyle(CustomColors.cyan)
                .padding()
        })
        .padding(.horizontal, GridPoints.custom(16))
    }}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(database: DbConnection(), authViewAdapter: AuthViewAdapter())
    }
}
