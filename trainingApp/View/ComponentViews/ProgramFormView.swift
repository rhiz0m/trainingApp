import SwiftUI

struct ProgramFormView: View {
    
    @ObservedObject var viewModel: ProgramViewModel
    
    var body: some View {
        TextField("Title", text: $viewModel.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
        
        TextField("Date",
                  text: $viewModel.dateString)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
        
        TextField("Description",
                  text: $viewModel.description)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
    }
}

#Preview {
    ProgramFormView(viewModel: ProgramViewModel())
}
