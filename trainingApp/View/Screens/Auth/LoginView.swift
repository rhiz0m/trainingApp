//
//  login.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @ObservedObject var db: DbViewModel
    @ObservedObject var authViewAdapter: AuthViewAdapter
    @State private var navigateToHome = false
    
    var body: some View {
        content
        NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
            EmptyView()
        }
    }
    
    @ViewBuilder private var content: some View {
        
        ZStack {
            backgroundImageView(imageName: "gym_manBg")
            VStack(spacing: CGFloat(GridPoints.x3)) {
                titleView
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
                                CustomColors.cyan.opacity(0.05),
                                Color.black.opacity(1)
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.bottom)
                )
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.black, CustomColors.cyan.opacity(0.25)],
                                                 startPoint: .topTrailing, endPoint: .bottomTrailing))
                .frame(height: 190)
                .rotationEffect(.degrees(165))
                .offset(x: 20, y: -80)
                .padding()
        }
    }
    
    @ViewBuilder private var titleView: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .scaledToFit()
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                Text("S T R E N G T H ◄ ► C A M P")
                    .padding()
                    .bold()
                    .italic()
                    .font(Font.custom("San Francisco", size: 16)  )
                    .foregroundColor(.white)
                Spacer()
            }.padding(.top).padding(.horizontal, GridPoints.x8)
            
        }
    }
    
    
    @ViewBuilder private var textFieldsView: some View {
        CustomTextField(
            textInput: $authViewAdapter.emailInput,
            title: authViewAdapter.emailPlaceHolder
        ).padding(.horizontal, GridPoints.x8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .textInputAutocapitalization(.never)
        
        CustomSecureFeild(
            textInput: $authViewAdapter.passwordInput,
            title: authViewAdapter.passwordPlaceHolder,
            onPress: {
                
            }
        ).padding(.horizontal, GridPoints.x8)
            .padding(.bottom, GridPoints.x2)
    }
    
    @ViewBuilder private var buttonsView: some View {
        
        Button(action: {
            
            loginPressed()
            
        }, label: {
            PrimaryBtnStyle(title: "Login", icon: "")
        })
        
        
        .padding(.horizontal, GridPoints.custom(16))
        
        NavigationLink(destination: SignUpView(database: db, authViewAdapter: authViewAdapter), label: {
            Text("Sign Up")
                .foregroundStyle(CustomColors.cyan)
        })
        .padding(.bottom, GridPoints.x3)
    }
    
    func loginPressed() {
        let email = authViewAdapter.emailInput
        let password = authViewAdapter.passwordInput
        
        guard !email.isEmpty, !password.isEmpty else {
            // Handle the case where email or password is empty
            print("Email or password is empty")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [self] authResult, error in
            if let error = error {
                print("Authentication failed: \(error.localizedDescription)")
            } else {
                print("Authentication successful")
                self.navToHome()
            }
        }
    }
    
    func navToHome() {
        navigateToHome = true
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        LoginView(db: DbViewModel(), authViewAdapter: AuthViewAdapter())
    }
}

