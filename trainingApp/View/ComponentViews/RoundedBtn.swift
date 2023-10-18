//
//  RoundedBtn.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-18.
//

import SwiftUI

struct RoundedBtn: View {
    
    var width: CGFloat = 60
    var height: CGFloat = 60
    var title: String
    var onPress: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            self.onPress()
        }) {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .frame(width: width, height: height)
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

struct RoundedBtn_Previews: PreviewProvider {
    static var previews: some View {
        RoundedBtn(title: "+", onPress: {})
    }
}
