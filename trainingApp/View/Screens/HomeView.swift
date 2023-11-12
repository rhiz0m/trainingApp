
import SwiftUI

struct HomeView: View {
    var body: some View {
            VStack {
                content
            }.navigationBarBackButtonHidden(true)
    }
}


@ViewBuilder private var content: some View {
    ZStack {
        backgroundImageView(imageName: "listBg")
        VStack(spacing: CGFloat(GridPoints.x1)) {
                programList
                bottomBar
            }
        }
    }


@ViewBuilder private func backgroundImageView(imageName: String) -> some View {
    Image(imageName)
        .resizable()
        .scaledToFit()
        .blur(radius: 2.5)
        .edgesIgnoringSafeArea(.bottom)
        .overlay(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.white.opacity(1),
                        Color.white.opacity(0.65)]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            
            .edgesIgnoringSafeArea(.bottom)
        )
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
