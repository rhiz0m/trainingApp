import SwiftUI

struct UpdateProgramView: View {
    @ObservedObject var db: DbConnection
    
    @Environment(\.dismiss) private var dismiss
    
    @State var title = ""
    @State var description = ""
    @State var date = ""
    
    @State var name = ""
    @State var muscleGroups = ""
    @State var weight = ""
    @State var reps = 0
    @State var sets = 0
    
    @State var selectedProgram: UsersPrograms?
    @State var selectedExercise: UsersExercises?
    
    var body: some View {
        VStack {
            ProgramFormView(db: db, title: $title, date: $date)
            ExerciseFormView(db: db, name: $name, muscleGroups: $muscleGroups, weight: $weight, reps: $reps, sets: $sets, selectedExercice: $selectedExercise)
            
            HStack {
                
                PrimaryBtn(title: "update") {
                    if let program = selectedProgram {
                        db.updateProgram(program: program)
                    }
                }

            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            
        }
        .onAppear {
            // Set the title based on the selected program

        }
        
    }
}

struct UpdateProgramView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProgramView(db: DbConnection())
    }
}

