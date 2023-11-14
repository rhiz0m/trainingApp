

import SwiftUI

struct ContentView: View {

    var body: some View {
        content
    }
}

@ViewBuilder private var content: some View {
    VStack(spacing: CGFloat(GridPoints.x3)) {
        navigation
    }
}

@ViewBuilder private var navigation: some View {
    NavStack()
    
}

@ViewBuilder private var bottomBar: some View {
    BottomBarView(db: DbConnection()).background(.black)
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

