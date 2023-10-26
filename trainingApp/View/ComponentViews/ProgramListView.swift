import SwiftUI

struct ProgramListView: View {
    @ObservedObject var viewModel = ProgramViewModel()

    var body: some View {
        NavigationView {
            List() {
                    VStack(alignment: .leading) {
                        Text(viewModel.title)
                        Text(formatDate(viewModel.date))
                    }

                  
                }
            }
            .navigationTitle("Training Programs")
            .onAppear {
                viewModel.getPrograms { programs in
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


struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView()
    }
}

