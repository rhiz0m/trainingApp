//
//  PrimaryBtn.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct PrimaryBtn: View {
    
    var height: CGFloat = 42
    var width: CGFloat = 300
    var fontSize: CGFloat = CGFloat(FontSizes().medium)
    var title: String
    var onPress: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.black, Color.indigo.opacity(0.6)]), startPoint: .center, endPoint: .top)
            .frame(width: width, height: height).cornerRadius(CGFloat(Spacing().medium))
            .overlay(
                RoundedRectangle(cornerRadius: CGFloat(Spacing().medium))
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
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
