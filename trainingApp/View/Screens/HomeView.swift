//
//  HomeScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var programViewModel = ProgramViewModel()
    
    let placeholderProgram = UsersPrograms(title: "Sample Program", date: Date(), description: "A description", exercises: [UsersExercises(name: "Exercise 1", muscleGroups: ["Legs"], weight: "100", reps: 10, sets: 3, totalReps: 30)])
    
    var body: some View {
        VStack {
            ProgramListView()
            BottomBarView(viewModel: ProgramViewModel())
        }

    }
}

@ViewBuilder private var ListView: some View {

    VStack {
       // ProgramListView(programViewModel: programViewModel)
    }
}

private struct BottomBarView: View {
    @ObservedObject var viewModel: ProgramViewModel


    var body: some View {
        HStack {
            NavigationLink(
                destination: CreateTrainingProgramView(viewModel: viewModel),
                label: {
                    SharedBtnStyle(title: "Add")
                }
            )

            NavigationLink(destination: DetailsView(), label: {
                SharedBtnStyle(title: "feat")
            })

            NavigationLink(destination: DetailsView(), label: {
                SharedBtnStyle(title: "feat 2")
            })

            NavigationLink(destination: DetailsView(), label: {
                SharedBtnStyle(title: "feat 3")
            })
        }.padding(.horizontal, GridPoints.x4)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
