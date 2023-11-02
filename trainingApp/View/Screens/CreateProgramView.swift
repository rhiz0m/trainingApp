//
//  CreateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct CreateProgramView: View {
    
    @ObservedObject var db: DbConnection
    
    @Environment(\.dismiss) private var dismiss
    
    @State var title = ""
    @State var description = ""
    @State var dateString = ""
    
    @State var name = ""
    @State var musclegroups = ""
    @State var weight = ""
    @State var reps = 0
    @State var sets = 0
    
    
    @State var selectedProgram: UsersPrograms?
    
    
    
    var body: some View {
        
        VStack {
            ProgramFormView(db: db,  title: $title, description: $description, dateString: $dateString, selectedProgram: $selectedProgram)
            ExerciseFormView(viewModel: db)
            
            HStack {
                NavigationLink(
                    destination: CreateExerciseView(viewModel: db),
                    label: {
                        SharedBtnStyle(title: "Add Exercise")
                    }
                )
                
      /*          Button(action: {
                    if let firstProgramId = db.usersPrograms.first?.id {
                        db.id = firstProgramId
                        db.deleteProgram {
                        dismiss()
                            print("Deleted succesfully!")
                        }
                    } else {
                        print("Error: No programs to delete.")
                    }
                }) {
                    Text("Delete c_p")
                } */
                
                PrimaryBtn(title: "Add", onPress: {
                    
                    if !title.isEmpty {
                        
                        let newExercise = UsersExercises(name: name, muscleGroups: [musclegroups], weight: weight, reps: reps, sets: sets,  totalReps: reps * sets)
                        let newProgram = UsersPrograms(title: title, date: Date(), description: description, exercises: [newExercise])
                        
                        db.addProgramToDb(userProgram: newProgram)
                        dismiss()
                    }
                })
                
              /*  PrimaryBtn(title: "Add") {
                    db.createProgram { documentId in
                        if let documentId = documentId {
                            print("Created program with ID:", documentId)
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            print("Failed to create program.")
                        }
                    }
                } */
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
            
            ExerciseListView()
            
        }.onAppear { db.clearFeilds() }
    }
}
    struct CreateProgramView_Previews: PreviewProvider {
        static var previews: some View {
            CreateProgramView(db: DbConnection())
        }
    }

