//
//  CreateTrainingView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-22.
//

import SwiftUI

struct CreateTrainingProgramView: View {

    @ObservedObject var viewModel: ProgramViewModel
    
    var program: UsersPrograms
    
        var body: some View {
            
            VStack {
                Text("My programs!").padding()
                
                TextField("Title: \(program.title)",
                          text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Description: \(program.description)",
                          text: $viewModel.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                DatePicker("Date:", selection: $viewModel.date, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
            
                Button(action: {
                    
                    viewModel.createTrainingProgram()
                    //viewModel.saveProgramToFirestore(id: viewModel.Id, title: viewModel.title, date: viewModel.date, description: viewModel.description)
                }, label: {
                    Text("Create!")
                })
            }
        }
   

   struct CreateTrainingView_Previews: PreviewProvider {
        static var previews: some View {
            let viewModel = ProgramViewModel()
            
            let placeholderProgram = UsersPrograms(
                id: "1",
                title: "Sample Program",
                date: Date(),
                description: "A description",
                exercises: [
                    UsersExercises(
                        name: "Exercise 1",
                        muscleGroups: ["Legs"],
                        reps: 10,
                        sets: 3,
                        totalReps: 30
                    )
                ]
            )

            return CreateTrainingProgramView(viewModel: viewModel, program: placeholderProgram)
        }
    }
}
