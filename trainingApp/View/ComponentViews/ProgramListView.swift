// ProgramListView.swift

import SwiftUI

struct ProgramListView: View {
    
    @ObservedObject var db: DbConnection
    
    //@State private var selectedProgram: UsersPrograms? = nil
    //@State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            Text("Your Programs").font(.title).bold()
            
            if let userData = db.currentUserData {
                
                if userData.programs.isEmpty {
                    Text("No programs yet")
                } else {
                    List(userData.programs) { program in
                        VStack(alignment: .leading) {
                            Text(program.title)
                            Text(program.description)
                        }
                        .padding()
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


struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView(db: DbConnection())
    }
}
