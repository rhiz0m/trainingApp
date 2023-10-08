//
//  CustomTextFeild.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var textInput: String
    var height: CGFloat = 42
    var width: CGFloat = 300
    var fontSize: CGFloat = CGFloat(FontSizes().medium)
    var title: String
    var onPress: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                TextField("", text: $textInput)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: width, height:height)
                    .padding(.leading, 20) // Add left padding for the entire TextField
                    .background(.white)
                    .cornerRadius(CGFloat(Spacing().large))
                    .padding(CGFloat(Spacing().xsmall))
                    .overlay(
                        RoundedRectangle(cornerRadius: CGFloat(Spacing().xl))
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.indigo.opacity(0.8), Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                    )
                    
                    .overlay(
                        Text(title)
                            .padding(CGFloat(Spacing().xsmall))
                            .foregroundColor(Color.secondary)
                            .padding(.horizontal, CGFloat(Spacing().xsmall))
                            .offset(x: -80, y: 0)
                            .font(.caption)
                            .opacity(textInput.isEmpty ? 1 : 0) // Show only when the textInput is empty
                    )
            }
        }
    }
}

struct InnerShadowView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(width: 200, height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(Color.black, lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.black, radius: 8, x: 0, y: 0) // Inner shadow
                    )
            )
    }
}

struct CustomTextFeild_Previews: PreviewProvider {
    @State static var textInput: String = ""
    
    static var previews: some View {
        CustomTextField(textInput: $textInput, title: "textFeild Title", onPress: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

