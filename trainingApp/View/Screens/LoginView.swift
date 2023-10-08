//
//  login.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    
    
    var body: some View {
        
        ZStack {
            Image("gym")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color.indigo.opacity(0.3), Color.black.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                )
                    
            VStack(spacing: CGFloat(Spacing().xl)) {
                CustomTextField(textInput: $emailInput, title: "Email", onPress: {})
                CustomTextField(textInput: $passwordInput, title: "Password", onPress: {})
                PrimaryBtn(width: 275, title: "Login", onPress: {})
                Text("Sign Up").foregroundColor(.white)
           
                        }.padding()
                .background(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom).padding()
        }
     
    }
}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
