//
//  SharedBtnStyle.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-11.
//

import SwiftUI

struct SharedBtnStyle: View {
    
    var title: String
    var height: CGFloat = 44
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue.opacity(0.45)]), startPoint: .bottom, endPoint: .top)
            .cornerRadius(GridPoints.x6)
            .frame(height: height)
            .overlay(
                RoundedRectangle(cornerRadius: GridPoints.x3)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .bottom, endPoint: .top), lineWidth: 2)
                    .background(
                        Text(title)
                        .font(.custom("Roboto-Medium", size: 16))
                        .foregroundColor(.white)
                    )
                )
    }
}

struct SharedBtnStyle_Previews: PreviewProvider {
    static var previews: some View {
        SharedBtnStyle(title: "title")
    }
}
