//
//  PrimaryBtn.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct PrimaryBtn: View {
   
    var width: CGFloat = .infinity
    var fixedHeight: CGFloat = 44
    var fontSize: CGFloat = CGFloat(FontSizes().medium)
    var title: String
    var onPress: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.black, Color.indigo.opacity(0.6)]), startPoint: .center, endPoint: .top).cornerRadius(GridPoints.x6).padding(.horizontal, GridPoints.x6)
            .overlay(
                RoundedRectangle(cornerRadius: GridPoints.x3)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2).padding(.horizontal, GridPoints.x6)
                    .background(
                    Button(action: {
                        self.onPress()
                        }) {
                        Text(title)
                        .foregroundColor(.white)
                        .font(.system(size: fontSize).bold())
                        }
                )
            ).frame(width: width, height: fixedHeight)
    }
}

struct PrimaryBtn_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryBtn(title: "my label", onPress: {print("")})
    }
}
