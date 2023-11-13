
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
        VStack() {
                programList
                bottomBar
            }
        }
    }

@ViewBuilder private func backgroundImageView(imageName: String) -> some View {
    Image(imageName)
        .resizable()
        .scaledToFit()
        .blur(radius: 3)
        .edgesIgnoringSafeArea(.all)
        .shadow(color: CustomColors.dark.opacity(0.7), radius: 5, x: 0, y: 1)
        .overlay(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.white.opacity(1),
                        Color.white.opacity(0.5)]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
        ).background(.black)
}


@ViewBuilder private var programList: some View {
        ProgramListView()
    
}

@ViewBuilder private var bottomBar: some View {
    BottomBarView(db: DbConnection())
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
