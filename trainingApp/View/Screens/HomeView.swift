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
            ProgramListView(db: DbConnection())
            BottomBarView(db: DbConnection())
        }.navigationBarBackButtonHidden(true)
    }
}


private struct BottomBarView: View {
    
    @ObservedObject var db: DbConnection
    
    var body: some View {
        
        NavigationStack {
            HStack {
                NavigationLink(
                    destination: CreateProgramView(db: db),
                    label: {
                        SharedBtnStyle(title: "Add")
                    }
                )
                .onTapGesture {
                    db.clearFeilds()
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
                Button(action: {
                    db.logout()
                }, label: {
                    Text("Logout")
                })
            }.padding(.horizontal, GridPoints.x4)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
