import SwiftUI

struct ProgramListView: View {
    @ObservedObject var viewModel = ProgramViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.usersPrograms, id: \.id) { program in
                NavigationLink(destination: ProgramDetailsView(program: program)) {
                    Text(program.title)
                    // Add other details as needed
                }
            }
            .navigationTitle("Training Programs")
            .onAppear {
                viewModel.getAllTrainingPrograms { programs in
                    viewModel.usersPrograms = programs
                }
            }
        }
    }
}

struct ProgramDetailsView: View {
    var program: UsersPrograms

    var body: some View {
        VStack {
            Text("Title: \(program.title)")
            // Add other details as needed
        }
        .navigationTitle(program.title)
    }
}

struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView()
    }
}

