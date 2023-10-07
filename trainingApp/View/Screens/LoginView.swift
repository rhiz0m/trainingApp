//
//  login.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct LoginView: View {
    
    @State private var textInput: String = ""
    var body: some View {
        
        ZStack {
            Image("gym")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.12), Color.clear]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                )
            VStack {Spacer()
                CustomTextField(textInput: $textInput)
                CustomTextField(textInput: $textInput)
                    Text("User's text: \(textInput)")
                                .padding()
                                .foregroundColor(.white)
                        }.padding()
                .background(Color.clear)
        }
    }
}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
