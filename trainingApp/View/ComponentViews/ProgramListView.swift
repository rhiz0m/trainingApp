

import SwiftUI

struct ProgramListView: View {
    
    var body: some View {
        content
    }
}

@ViewBuilder private var content: some View {
    ZStack{
        VStack() {
            list
        }
    }
}

@ViewBuilder private var list: some View {
    ExerciseList(db: DbConnection())
}

struct ProgramListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramListView()
    }
}
