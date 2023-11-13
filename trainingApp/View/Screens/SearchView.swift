import SwiftUI


struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var title = ""
    
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
                            Color.indigo.opacity(0.2),
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
        HStack {
            CustomTextField(textInput: $title, title: "musclegroups...", onPress: {})
            
            Button(action: {
                viewModel.API(muscle: title)
            }, label: {
                RoundedBtn(title: "", icon: "magnifyingglass.circle.fill")
            })
            
           /* PrimaryBtn(title: "Search", onPress: {
                viewModel.API(muscle: title)
            }).padding(.horizontal, GridPoints.x6)
                .padding(.bottom, GridPoints.x2) */
       
            
            
        }.padding(.horizontal, GridPoints.x8)
            .padding(.vertical, GridPoints.x4)
           
        }
    }

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


