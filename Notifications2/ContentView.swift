import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AddIngrView()) {
                    Text("Add an ingredient")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
                
                NavigationLink(destination: AddDishView()) {
                    Text("Add a recipe")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
                
                NavigationLink(destination: AddMealView()) {
                    Text("Plan a meal")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
                
                NavigationLink(destination: AddStockView()) {
                    Text("What do you have in stock today?")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
                
                NavigationLink(destination: TimeTableView()) {
                    Text("View Plan")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
                
                NavigationLink(destination: ViewToBuy()) {
                    Text("View to buy list")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Food Health")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
