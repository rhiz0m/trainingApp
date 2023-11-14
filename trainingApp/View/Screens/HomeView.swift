
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
        backgroundImageView(imageName: "gymEquipBg")
            .edgesIgnoringSafeArea(.vertical)
        VStack() {
                programList
                Spacer()
                bottomBar
            }
        }
    }

@ViewBuilder private func backgroundImageView(imageName: String) -> some View {
    Image(imageName)
        .resizable()
        .scaledToFit()
        .edgesIgnoringSafeArea(.vertical)
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
