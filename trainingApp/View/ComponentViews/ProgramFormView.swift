import SwiftUI

struct ProgramFormView: View {
    
    @ObservedObject var viewModel: DbViewModel
    
    @Binding var selectedProgram: UsersPrograms?

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

struct ProgramFormView_Previews: PreviewProvider {
    static var previews: some View {
            let viewModel = DbViewModel()
            let selectedProgram = Binding<UsersPrograms?>(
                get: { nil },
                set: { _ in }
            )
            
            return ProgramFormView(viewModel: viewModel, selectedProgram: selectedProgram)
        }
}
