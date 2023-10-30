// ProgramListView.swift

import SwiftUI

struct ProgramListView: View {
    @ObservedObject var viewModel = ProgramViewModel()
    @State private var selectedProgram: UsersPrograms? = nil
    @State private var isActive: Bool = false

    var body: some View {
        List(viewModel.usersPrograms) { program in
            NavigationLink(
                destination: UpdateProgramView(viewModel: viewModel, selectedProgram: selectedProgram),
                isActive: Binding(
                    get: { isActive },
                    set: { newValue in
                        selectedProgram = newValue ? program : nil
                        isActive = newValue
                    }
                )
            ) {
                VStack(alignment: .leading) {
                    Text(program.title)
                    Text(formatDate(program.date))
                }
            }
            .buttonStyle(PlainButtonStyle()) // Remove button styling
        }
        .navigationTitle("Training Programs")
        .onAppear {
            viewModel.getPrograms { programs in
                if programs.isEmpty {
                    print("No programs found.")
                } else {
                    print("Fetched programs successfully:", programs)
                    viewModel.usersPrograms = programs
                }
            }
        }
    }

    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}

struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView()
    }
}
