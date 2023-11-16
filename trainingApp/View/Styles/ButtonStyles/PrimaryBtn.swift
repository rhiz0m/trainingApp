//
//  PrimaryBtn.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct PrimaryBtn: View {
    
    var fixedHeight: CGFloat = 44
    var title: String
    var onPress: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.onPress()
            }) {
                Text(title)
                    .foregroundColor(.white)
                    .padding().frame(maxWidth: .infinity, minHeight: fixedHeight)
            }
            .background(
                RoundedRectangle(cornerRadius: GridPoints.x2)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, CustomColors.darkerCyan.opacity(0.6)]), startPoint: .center, endPoint: .top))
            )
            .overlay(
                RoundedRectangle(cornerRadius: GridPoints.x2)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.black, CustomColors.darkerCyan]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            )
           
        }
    }
}

struct PrimaryBtn_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryBtn(title: "my label", onPress: {})
    }
}
