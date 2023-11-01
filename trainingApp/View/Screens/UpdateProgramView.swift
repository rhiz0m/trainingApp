import SwiftUI

struct UpdateProgramView: View {
    @ObservedObject var viewModel: DbViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedProgram: UsersPrograms?

    var body: some View {
        VStack {
            ProgramFormView(viewModel: viewModel, selectedProgram: $selectedProgram)

            HStack {
                PrimaryBtn(title: "Update") {
                    // Validate that the title is not empty
                    guard !viewModel.title.isEmpty else {
                        print("Error: No program title.")
                        return
                    }

                    // Set viewModel.id with the ID of the selected program
                    viewModel.id = selectedProgram?.id ?? ""

                    let updatedExercises = [UsersExercises(
                        name: viewModel.name,
                        muscleGroups: viewModel.muscleGroups.components(separatedBy: ","),
                        weight: viewModel.weight,
                        reps: viewModel.reps,
                        sets: viewModel.sets,
                        totalReps: viewModel.reps * viewModel.sets
                    )]

                    // Call the updateProgram function
                    viewModel.updateProgram(programId: viewModel.id, updatedTitle: viewModel.title, updatedExercises: updatedExercises)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
        }
        .onAppear {
            // Set the title based on the selected program
            viewModel.title = selectedProgram?.title ?? ""
            viewModel.name = selectedProgram?.exercises.first?.name ?? ""
            viewModel.muscleGroups = selectedProgram?.exercises.first?.muscleGroups.joined(separator: ",") ?? ""
        }

    }
}

struct UpdateProgramView_Previews: PreviewProvider {
    static var previews: some View {
        let previewViewModel = DbViewModel()
        let sampleProgram = UsersPrograms(id: "sampleId", title: "Sample Program", date: Date(), description: "Sample Description", exercises: [UsersExercises(name: "Sample Exercise", muscleGroups: ["Legs"], weight: "50", reps: 10, sets: 3, totalReps: 30)])
        
        return UpdateProgramView(viewModel: previewViewModel, selectedProgram: sampleProgram)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}

