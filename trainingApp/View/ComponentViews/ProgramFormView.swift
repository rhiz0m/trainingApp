import SwiftUI

struct ProgramFormView: View {
    
    @ObservedObject var db: DbConnection
    
    @Binding var title: String
    @Binding var date: String
    var selectedProgram: UsersPrograms?

    var body: some View {
        TextField("Title", text: $title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)

        TextField("Date",
                  text: $date)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.vertical, GridPoints.x1)
            .padding(.horizontal, GridPoints.x4)
    }
}

struct ProgramFormView_Previews: PreviewProvider {
    static var previews: some View {
        let db = DbConnection()
        let selectedProgram = UsersPrograms(id: UUID(), exerciseIds: [], title: "Test", date: Date(), description: "Description", exercises: [])

        let date = Binding.constant("2023-11-02")
        
        return ProgramFormView(db: db, title: .constant("test"), date: date, selectedProgram: selectedProgram)
    }
}
