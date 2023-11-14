//
//  CustomSecureFeild.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-01.
//

import SwiftUI

struct CustomSecureFeild: View {
    
    @Binding var textInput: String
    
    var fixedHeight: CGFloat = 44
    var fontSize: CGFloat = CGFloat(FontSizes().medium)
    var title: String
    var onPress: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                SecureField("", text: $textInput)
                    .autocapitalization(.none)
                    .padding(.leading, GridPoints.custom(1.5))
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(height: fixedHeight)
                    .background(.white)
                    .cornerRadius(GridPoints.x6)
                    .padding(GridPoints.half)
                    .overlay(
                        RoundedRectangle(cornerRadius: GridPoints.x6)
                            .stroke(LinearGradient(gradient: Gradient(colors: [CustomColors.darkerCyan.opacity(0.8), Color.white.opacity(0.6)]), startPoint: .bottom, endPoint: .top), lineWidth: 1)
                    )
                
                if textInput.isEmpty {
                    Text(textInput.isEmpty ? title : textInput)
                        .foregroundColor(textInput.isEmpty ? Color(Color.black) : Color.white)
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
            
        }
    }
}


struct CustomSecureFeild_Previews: PreviewProvider {
    @State static var textInput: String = ""
    
    static var previews: some View {
        CustomSecureFeild(textInput: $textInput, title: "textFeild Title", onPress: {})
            .previewLayout(.sizeThatFits)
        
    }
}
