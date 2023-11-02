import SwiftUI

struct UpdateProgramView: View {
    @ObservedObject var db: DbConnection
    @Environment(\.presentationMode) var presentationMode
    
    @State var title = ""
    @State var description = ""
    @State var dateString = ""
    @State var selectedProgram: UsersPrograms?
    
    var body: some View {
        VStack {
            ProgramFormView(db: db,  title: $title, description: $description, dateString: $dateString, selectedProgram: $selectedProgram)
            
            HStack {
             /*   PrimaryBtn(title: "Update") {
                    // Validate that the title is not empty
                    guard !db.title.isEmpty else {
                        print("Error: No program title.")
                        return
                    }
                    
                    // Set viewModel.id with the ID of the selected program
                    db.id = selectedProgram?.id ?? ""
                    
                    let updatedExercises = [UsersExercises(
                        name: db.name,
                        muscleGroups: db.muscleGroups.components(separatedBy: ","),
                        weight: db.weight,
                        reps: db.reps,
                        sets: db.sets,
                        totalReps: db.reps * db.sets
                    )]
                    
                    // Call the updateProgram function
                    db.updateProgram(programId: db.id, updatedTitle: db.title, updatedExercises: updatedExercises)
                    presentationMode.wrappedValue.dismiss()
                } */
                
             /*   PrimaryBtn(title: "Delete") {
                    
                    guard let programId = selectedProgram?.id else {
                        print("Error: No program ID.")
                        return
                    }
                    
                    db.id = programId
                    
                    db.deleteProgram {
                        presentationMode.wrappedValue.dismiss()
                    }
                } */
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
        let previewViewModel = DbConnection()
 /*       let sampleProgram = UsersPrograms(id: "sampleId", title: "Sample Program", date: Date(), description: "Sample Description", exercises: [UsersExercises(name: "Sample Exercise", muscleGroups: ["Legs"], weight: "50", reps: 10, sets: 3, totalReps: 30)])
        
        return UpdateProgramView(db: previewViewModel, selectedProgram: sampleProgram)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13")) */
    }
}

