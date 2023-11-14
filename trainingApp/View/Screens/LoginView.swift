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
                                CustomColors.cyan.opacity(0.07),
                                Color.black.opacity(1)
                            ]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.bottom)
                )
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.black, Color.orange],
                                                 startPoint: .topTrailing, endPoint: .bottomTrailing))
                .frame(height: 190)
                .rotationEffect(.degrees(165))
                .offset(x: 20, y: -10)
                .padding()
        }
    }

    @ViewBuilder private var titleView: some View {

            VStack(alignment: .leading) {
                HStack() {
                    Text("s T R E N G T H")
                        .italic()
                        .font(.headline)
                        .foregroundStyle(Color.orange)
                        .padding(.top, GridPoints.x4)

                }
                HStack() {

                    Text("c a m P")
                        .italic()
                        .rotationEffect(.degrees(180))
                        .font(.headline)
                        .foregroundStyle(.white)
                        .font(.custom("Arial", size: 18))
                    Image(.dumbell).resizable().frame(width: 40, height: 40)
                        .rotationEffect(.degrees(145))
                    Spacer()
                    
                }
              
            }.padding(.horizontal, GridPoints.custom(10))
    }

    
    @ViewBuilder private var textFieldsView: some View {
        CustomTextField(
            textInput: $authViewAdapter.emailInput,
            title: authViewAdapter.emailPlaceHolder,
            onPress: {
                
            }
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
       
        .padding(.bottom, GridPoints.x3)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {

        LoginView(db: DbConnection(), authViewAdapter: AuthViewAdapter())
    }
}

