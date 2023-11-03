import SwiftUI

struct UpdateProgramView: View {
    @ObservedObject var db: DbConnection
    //@Environment(\.presentationMode) var presentationMode
    
    @State var title = ""
    @State var description = ""
    @State var dateString = ""
    @State var selectedProgram: UsersPrograms?
    
    var body: some View {
        VStack {
            ProgramFormView(db: db,  title: $title, description: $description, dateString: $dateString, selectedProgram: $selectedProgram)
            
            HStack {
                
                PrimaryBtn(title: "add exercice", onPress: {})

            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            
        }
        .onAppear {
            // Set the title based on the selected program
            db.title = selectedProgram?.title ?? ""
            db.name = selectedProgram?.exercises.first?.name ?? ""
            db.muscleGroups = selectedProgram?.exercises.first?.muscleGroups.joined(separator: ",") ?? ""
        }
        
    }
}

struct UpdateProgramView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProgramView(db: DbConnection())
    }
}

