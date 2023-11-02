import SwiftUI

struct ProgramFormView: View {
    
    @ObservedObject var db: DbConnection
    
    @Binding var title: String
    @Binding var description: String
    @Binding var dateString: String
    @Binding var selectedProgram: UsersPrograms?

    var body: some View {
        TextField("Title", text: $title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)

        TextField("Date",
                  text: $dateString)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)

        TextField("Description",
                  text: $description)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
    }
}

struct ProgramFormView_Previews: PreviewProvider {
    static var previews: some View {
            let viewModel = DbConnection()
            let selectedProgram = Binding<UsersPrograms?>(
                get: { nil },
                set: { _ in }
            )
        
        let dateString = Binding.constant("2023-11-02")
            
        return ProgramFormView(db: viewModel, title: .constant("test"), description: .constant("a test description"), dateString: dateString, selectedProgram: selectedProgram)
        }
}
