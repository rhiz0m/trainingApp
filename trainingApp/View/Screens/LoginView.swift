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
            Image("loginBg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
              
            Text("Login View!").foregroundColor(.white)
            VStack {
                    CustomTextField(textInput: $textInput)
                    Text("Du skrev: \(textInput)")
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
