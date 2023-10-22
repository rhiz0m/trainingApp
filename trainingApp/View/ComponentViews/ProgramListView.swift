import SwiftUI

struct ProgramListView: View {
    @ObservedObject var viewModel = ProgramViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.usersPrograms, id: \.id) { program in
                NavigationLink(destination: UpdateTrainingProgramView(viewModel: viewModel, program: program)) {
                    Text(program.title)
                  
                }
            }
            .navigationTitle("Training Programs")
            .onAppear {
                viewModel.getTrainingPrograms { programs in
                    viewModel.usersPrograms = programs
                }
            }
        }
    }
}



struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView()
    }
}

