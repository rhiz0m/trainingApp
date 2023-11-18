
import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
            VStack() {
                content
            }.navigationBarBackButtonHidden(true)
    }
}

@ViewBuilder private var content: some View {
    ZStack {
        backgroundImageView(imageName: "gymEquipBg")
            .edgesIgnoringSafeArea(.vertical)
        VStack() {
            Spacer()
            bottomBar()
     
            }
        }
    }

@ViewBuilder private func backgroundImageView(imageName: String) -> some View {
    Image(imageName)
        .resizable()
        .scaledToFit()
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
        )
}


struct bottomBar: View {
    @State private var tabSelection = 1
    var body: some View {
        ZStack(alignment: .bottom) {
                TabView(selection: $tabSelection) {
                    ProgramListView()
                        .tabItem {
                    }.tag(1)
                    
                    CreateExerciseView(db: DbViewModel()).tabItem {
                    }.tag(2)
                    
                    SearchView().tabItem {
                    }.tag(3)
                    
                    
                    MapsView().tabItem {
                    }.tag(4)
                }
                CustomBottomBar(tabSelection: $tabSelection)
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
