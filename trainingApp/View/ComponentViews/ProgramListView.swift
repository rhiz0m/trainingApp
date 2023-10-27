import SwiftUI

// ProgramListView.swift

import SwiftUI

struct ProgramListView: View {
    
    @ObservedObject var viewModel = ProgramViewModel()
    @State private var selectedProgramTitle: String? = nil
    
    var body: some View {
        List {
            ForEach(viewModel.usersPrograms) { program in
                NavigationLink(destination: UpdateProgramView(viewModel: viewModel, selectedTitle: $selectedProgramTitle), tag: program.title, selection: $selectedProgramTitle) {
                    VStack(alignment: .leading) {
                        Text(program.title)
                        Text(formatDate(program.date))
                    }
                }
            }
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



