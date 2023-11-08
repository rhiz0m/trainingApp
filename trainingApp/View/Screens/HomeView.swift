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
                
                NavigationLink(destination: SearchView(), label: {
                    SharedBtnStyle(title: "search")
                })
                
                NavigationLink(destination: MapsView(), label: {
                    
                    SharedBtnStyle(title: "maps")
                })
                
                NavigationLink(destination: SettingsView(), label: {
                    SharedBtnStyle(title: "Settings")
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
