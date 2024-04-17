//
//  ViewToBuy.swift
//  Notifications2
//
//  Created by Leo GGL on 17.04.2024.
//

import SwiftUI
import CoreData

struct ViewToBuy: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: TimeTable.entity(), sortDescriptors: [])
    private var timeTableList: FetchedResults<TimeTable>
    
    @FetchRequest(entity: InStock.entity(), sortDescriptors: [])
    private var inStockList: FetchedResults<InStock>
    
    var body: some View {
        List {
            ForEach(timeTableList) { timeTable in
                if let dishName = timeTable.nameDish {
                    let dishIngredients = getIngredientsForDish(dishName: dishName)
                    ForEach(dishIngredients, id: \.ingid) { ingredient in
                        let needAmount = calculateNeedAmount(ingredient: ingredient)
                        if needAmount > 0 {
                            if let ingName = ingredient.ingname {
                                let text = "Ingredient: \(ingName), Need: \(needAmount)"
                                Text(text)
                                    .onAppear {
                                        saveToBuy(ingtob: ingName, need: needAmount)
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getIngredientsForDish(dishName: String) -> [Ingr] {
        
        return []
    }
    
    func calculateNeedAmount(ingredient: Ingr) -> Int {
        
        return 0
    }
    
    func saveToBuy(ingtob: String, need: Int) {
        let newToBuy = ToBuy(context: viewContext)
        newToBuy.ingtob = Int32(need)
        newToBuy.need = ingtob
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
