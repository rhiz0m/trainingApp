//
//  SwiftUIView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-26.
//

import SwiftUI

struct ProgramFormView: View {
    
    @ObservedObject var viewModel: ProgramViewModel
    
    var body: some View {
        TextField("Title: \(viewModel.title)",
                  text: $viewModel.title)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
        TextField("Date: \(viewModel.date)",
                  text: $viewModel.id)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
        TextField("Description: \(viewModel.description)",
                  text: $viewModel.description)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.vertical, GridPoints.x1)
        .padding(.horizontal, GridPoints.x4)
        
    }
}

#Preview {
    ProgramFormView(viewModel: ProgramViewModel())
}
