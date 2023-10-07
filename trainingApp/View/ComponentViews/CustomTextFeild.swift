//
//  CustomTextFeild.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var textInput: String

    var body: some View {
        VStack {
            TextField("user input", text: $textInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding().frame(maxWidth: 300)
    }
}

struct CustomTextFeild_Previews: PreviewProvider {
    @State static var textInput: String = ""
    
    static var previews: some View {
        CustomTextField(textInput: $textInput)
    }
}
