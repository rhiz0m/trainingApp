//
//  PrimaryBtn.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct PrimaryBtn: View {
    
    var height: CGFloat = 42
    var width: CGFloat = 150
    var fontSize: CGFloat = CGFloat(FontSizes().medium)
    var title: String
    var onPress: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: width, height: height).cornerRadius(CGFloat(Spacing().medium))
            .overlay(
                RoundedRectangle(cornerRadius: CGFloat(Spacing().medium))
                .stroke(Color.black, lineWidth: 2)
                .background(
                    Button(action: {
                        self.onPress()
                        }) {
                        Text(title)
                        .foregroundColor(.white)
                        .font(.system(size: fontSize).bold())
                        }
            )
        )
    }
}

struct PrimaryBtn_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryBtn(title: "my label", onPress: {print("")})
    }
}
