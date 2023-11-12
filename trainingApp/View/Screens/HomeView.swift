
import SwiftUI

struct HomeView: View {
    var body: some View {
            VStack {
                content
            }.navigationBarBackButtonHidden(true)
    }
}


@ViewBuilder private var content: some View {
    VStack(spacing: CGFloat(GridPoints.x3)) {
                programList
                bottomBar
        }
}

@ViewBuilder private var programList: some View {
    ProgramListView()
    
}

@ViewBuilder private var bottomBar: some View {
    BottomBarView(db: DbConnection()).background(.black)
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
