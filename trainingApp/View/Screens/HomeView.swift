//
//  HomeScreen.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-10-07.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        homeCell()
    }
}

struct homeCell: View {
  
    
    var body: some View {
  
        VStack {
            RoundedBtn(title: "+", onPress: {})
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
