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
                RoundedRectangle(cornerRadius: GridPoints.x6)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.indigo.opacity(0.6)]), startPoint: .center, endPoint: .top))
            )
            .overlay(
                RoundedRectangle(cornerRadius: GridPoints.x6)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
            )
           
        }
    }
}

struct PrimaryBtn_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryBtn(title: "my label", onPress: {})
    }
}
