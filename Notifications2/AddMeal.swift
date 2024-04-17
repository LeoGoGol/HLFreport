import SwiftUI

struct AddMealView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismm
    
    @State private var name = ""
    @State private var selectedDate = Date()

    var body: some View {
        
        Form{
            
            TextField("Recepie:", text: $name)
            
            VStack {
                
                
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                
                Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
            }
            .padding()
            
            HStack{
                Spacer()
                Button("Submit"){
                    
                    DatCntrl().addMeal(name: name, time: selectedDate, context: managedObjContext)
                    dismm()
                    
                    presentationMode.wrappedValue.dismiss()
                    
                    
                    
                }
                Spacer()
            }
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }
}






#Preview {
    AddMealView()
}
