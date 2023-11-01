//
//  HomeScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack {
            ProgramListView()
            BottomBarView(viewModel: DbViewModel())
        }

    }
}

private struct BottomBarView: View {
    
    @ObservedObject var viewModel: DbViewModel

    var body: some View {
        HStack {
            NavigationLink(
                destination: CreateProgramView(viewModel: viewModel),
                label: {
                    SharedBtnStyle(title: "Add")
                }
            )
            .onTapGesture {
                viewModel.clearFeilds()
            }
                    
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
