import SwiftUI
import CoreData

struct TimeTableCardView: View {
    var nameDish: String
    var timeOfMeal: Date
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let backgroundColor = colorScheme == .dark ? Color.gray : Color(.systemGray6)
        
        return VStack {
            Text(nameDish)
                .font(.title)
            Text("\(formattedDate(timeOfMeal))")
                .font(.subheadline)
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
}

struct TimeTableView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: TimeTable.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \TimeTable.timeOfMeal, ascending: true)
        ]
    ) var timeTable: FetchedResults<TimeTable>
    
    var body: some View {
        let today = Date()
        let futureDate = Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 30)) ?? Date()
        
        if timeTable.isEmpty {
            return AnyView(TimeTableCardView(nameDish: "Mayonesnaya Zmeyka", timeOfMeal: futureDate)
                .padding())
        } else {
            return AnyView(
                VStack {
                    ForEach(timeTable, id: \.self) { entry in
                        if let timeOfMeal = entry.timeOfMeal, timeOfMeal >= today {
                            TimeTableCardView(nameDish: entry.nameDish ?? "", timeOfMeal: timeOfMeal)
                                .padding()
                        }
                    }
                }
            )
        }
    }
}
