import SwiftUI


struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var title = ""
    //@State private var apiResponse: String = ""
    
    var body: some View {
        content
    }
    
    @ViewBuilder private var content: some View {
        ZStack {
            backgroundImageView(imageName: "gym_loginBg")
            VStack(spacing: CGFloat(GridPoints.x3)) {
                searchFeildView
                resultListView()
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
    
    @ViewBuilder private func resultListView() -> some View {
        VStack {
            List(viewModel.apiResponse) { exerciseInfo in
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name: \(exerciseInfo.name)")
                        .foregroundColor(.black)
                    Text("Type: \(exerciseInfo.type)")
                        .foregroundColor(.black)
                    
                    Text("Muscle: \(exerciseInfo.muscle)")
                        .foregroundColor(.black)

                    Text("Equipment: \(exerciseInfo.equipment)")
                        .foregroundColor(.black)
                    
                    Text("Muscle: \(exerciseInfo.difficulty)")
                        .foregroundColor(.black)
                    
                    Text("Muscle: \(exerciseInfo.instructions)")
                        .foregroundColor(.black)
                }
            }.padding()
            .listStyle(PlainListStyle())
        }
        .padding()
    }




    
    @ViewBuilder private var searchFeildView: some View {
        VStack {
            CustomTextField(textInput: $title, title: "musclegroup", onPress: {})
            
            PrimaryBtn(title: "Search Muscles", onPress: {
                viewModel.API(muscle: title)
            })
            

        
            }
        }
    }

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


