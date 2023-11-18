

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

