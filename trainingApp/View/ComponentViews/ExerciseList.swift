//
//  programList.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-12.
//

import SwiftUI

struct ExerciseList: View {
    @ObservedObject var db: DbConnection
    @StateObject private var viewModel = ExerciseViewModel()
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                Image(.barbell)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                Text("Welcome")
                    .font(.title).bold()
                    .foregroundStyle(.black)
            }.padding(.top)
                Spacer()
            
            if let userData = db.currentUserData {
                if userData.usersExercises.isEmpty {
                    Text("No programs yet").italic()
                    Spacer()
                } else {
                    List(userData.usersExercises) { exercise in
                        
                        NavigationLink(
                            destination: UpdateProgramView(
                                db: db,
                                viewModel: viewModel
                            ),
                            tag: exercise.id,
                            selection: $viewModel.selectedExerciseID
                            
                        ) {
                            VStack(alignment: .leading) {
                                Text(exercise.exerciseName)
                                    .font(.headline)
                                    .bold()
                                    .foregroundStyle(.white)
                                    .padding(.vertical, GridPoints.x1)
                                Text("Type: \(exercise.type)")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                Text("Muscle Groups: \(exercise.muscleGroups.joined(separator: " "))")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                
                                ForEach(exercise.usersTrainingRecords) { records in
                                    HStack() {
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("Weight: \(records.weight)").foregroundStyle(.white).font(.caption)
                                                Text("Sets: \(records.sets)").foregroundStyle(.white).font(.caption)
                                                Text("Reps: \(records.reps)").foregroundStyle(.white).font(.caption)
                                                
                                            }
                                            HStack {
                                                Text("Total Reps: \(records.totalReps)")
                                                    .foregroundStyle(.white)
                                                    .font(.caption)
                                                Text("Total Weight: \(records.totalWeight)")
                                                    .foregroundStyle(.white)
                                                    .font(.caption)
                                            }
                                        }
                                        Spacer()
                                        Image(systemName: "arrow.right.circle")
                                            .foregroundColor(CustomColors.cyan)
                                            .font(.system(size: 40))
                                    }
                                }
                            }
                        }
                        
                        .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color.black, Color(red: 33/255, green: 49/255, blue: 61/255)]), startPoint: .bottom, endPoint: .top)
                            .cornerRadius(GridPoints.half))
                        
                        
                        VStack {
                            Button(action: {
                                db.deleteProgram(exercise: exercise)
                            }, label: {
                                HStack(alignment: .center) {
                                    RoundedBtn(title: "", icon: "trash")
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        Text("Created:").font(.caption)
                                        Text("\(formatDate(exercise.date))")
                                    }
                                    
                                }.padding(GridPoints.x2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: GridPoints.x4)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [CustomColors.dark, Color.black]),
                                                                   startPoint: .bottom,
                                                                   endPoint: .top),
                                                                    lineWidth: 2))
                            })
                        }
                        .listRowBackground(Color.black).cornerRadius(GridPoints.x1)
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
}

private func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    return dateFormatter.string(from: date)
}

#Preview {
    ExerciseList(db: DbConnection())
}
