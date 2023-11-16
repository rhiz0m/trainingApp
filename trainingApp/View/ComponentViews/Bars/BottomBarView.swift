//
//  BottomBarView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-12.
//

import SwiftUI

struct BottomBarView: View {
    @ObservedObject var db: DbViewModel
    
    var body: some View {
 
            VStack {
                HStack {
                    NavigationLink(
                        destination: CreateExerciseView(db: db),
                        label: {
                            PrimaryBtnStyle(
                                title: "Add",
                                icon: "plus.circle.fill"
                            )
                        }
                    )
                    
                    NavigationLink(destination: SearchView(), label: {
                        PrimaryBtnStyle(title: "Search",
                                       icon: "magnifyingglass.circle.fill")
                    })
                    
                    NavigationLink(destination: Maps(), label: {
                        PrimaryBtnStyle(title: "Maps",
                                       icon: "map.fill")
                    })
                    
                    
                    
                    Button(action: {
                        db.logout()
                    }, label: {
                        RoundedBtn(title: "", icon: "power")
                    })
                }
            }.padding().background(.black)
        }
    }


#Preview {
    BottomBarView(db: DbViewModel())
}
