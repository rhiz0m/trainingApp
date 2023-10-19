//
//  HomeScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var programViewModel = ProgramViewModel()
    
    var body: some View {
        VStack {
            ListView
            BottomBarView
        }

    }
}

@ViewBuilder private var ListView: some View {

    VStack {
       // ProgramListView(programViewModel: programViewModel)
    }
}

@ViewBuilder private var BottomBarView: some View {
    HStack {
        
    NavigationLink(destination: DetailsView(), label: {
        SharedBtnStyle(title: "Add")
    })
        
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
