// ProgramListView.swift

import SwiftUI

import SwiftUI

struct ProgramListView: View {
    
    @ObservedObject var db: DbConnection
    
    var body: some View {
        VStack {
            Text("Your Programs")
                .font(.title)
                .bold()
            
            if let userData = db.currentUserData {
                if userData.programs.isEmpty {
                    Text("No programs yet")
                } else {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(userData.programs, id: \.id) { program in
                    
                                Button(action: {
                                    db.deleteProgram(program: program)
                                }) {
                                    Text("Delete")
                                        .foregroundColor(.red)
                                }
                                Text(program.title)
                                    .font(.headline)
                        }
                    }
                }
            } else {
                Text("An unexpected error occurred")
            }
        }
        .padding()
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




