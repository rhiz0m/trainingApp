

import SwiftUI

struct ProgramListView: View {
    
    var body: some View {
        content
    }
}

@ViewBuilder private var content: some View {
    ZStack{
        //backgroundImageView(imageName: "gym_loginBg")
        VStack(spacing: CGFloat(GridPoints.x3)) {
            list
        }
    }
}

@ViewBuilder private func backgroundImageView(imageName: String) -> some View {
    Image(imageName)
        .resizable()
        .scaledToFill()
        .edgesIgnoringSafeArea(.bottom)
        .overlay(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color.indigo.opacity(0.5),
                        Color.black.opacity(0.9)]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.bottom)
        )
}

@ViewBuilder private var list: some View {
    ExerciseList(db: DbConnection())
}

struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView()
    }
}
