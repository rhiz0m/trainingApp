//
//  CustomTextFeild.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var textInput: String
    
    var fixedHeight: CGFloat = 44
    var fontSize: CGFloat = CGFloat(FontSizes().medium)
    var title: String
    var onPress: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                TextField("", text: $textInput)
                    .padding()
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: fixedHeight)
                    .background(.black)
                    .cornerRadius(GridPoints.x6)
                    .padding(GridPoints.half)
                    .overlay(
                        RoundedRectangle(cornerRadius: GridPoints.x6)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.indigo.opacity(0.8), Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                    ).padding(.horizontal, GridPoints.x4)
                    .overlay(
                        Text(textInput.isEmpty ? title : textInput)
                            .foregroundColor(textInput.isEmpty ? Color(red: 122/255, green: 245/255, blue: 255/255) : Color.white) // if not empty, use change color to white when user types
                            .font(.caption)
                            .padding(.horizontal, GridPoints.x8)
                            .multilineTextAlignment(.leading) // Align text to the left
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )

            }
        }
    }
}

struct CustomTextFeild_Previews: PreviewProvider {
    @State static var textInput: String = ""
    
    static var previews: some View {
        CustomTextField(textInput: $textInput, title: "textFeild Title", onPress: {})
            .previewLayout(.sizeThatFits)
       
    }
}

