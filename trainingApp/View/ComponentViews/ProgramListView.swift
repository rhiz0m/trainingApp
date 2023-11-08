// ProgramListView.swift


import SwiftUI

struct ProgramListView: View {
    @ObservedObject var db: DbConnection
    @State private var selectedProgram: UsersPrograms?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Programs")
                    .font(.title)
                    .bold()
                
                if let userData = db.currentUserData {
                    if userData.programs.isEmpty {
                        Text("No programs yet")
                    } else {
                        VStack() {
                            List(userData.programs, id: \.id) { program in
                                NavigationLink(destination: UpdateProgramView(db: db, selectedProgram: program)) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(program.title)
                                            .font(.headline)
                                    }
                                    
                                }.listRowBackground(Color.white)
                                Button(action: {
                                    db.deleteProgram(program: program)
                                }) {
                                    Text("Delete")
                                        .foregroundColor(.cyan)
                                }
                                    
                            }
                        }
                        
                    }
                } else {
                    Text("An unexpected error occurred")
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
        ProgramListView(db: DbConnection())
    }
}
