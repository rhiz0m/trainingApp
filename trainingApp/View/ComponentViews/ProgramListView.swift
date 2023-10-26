import SwiftUI

struct ProgramListView: View {
    
    @ObservedObject var viewModel = ProgramViewModel()

    var body: some View {
            List() {
                    VStack(alignment: .leading) {
                        Text(viewModel.title)
                        Text(formatDate(viewModel.date))
                    }
                }
           
            .navigationTitle("Training Programs")
            .onAppear {
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

