//
//  DatCntrl.swift
//  HLTF
//
//  Created by Leo GGL on 23.01.2024.
//

import Foundation
import CoreData

class DatCntrl: ObservableObject{
    
    static let shared = DatCntrl()
    
    let container = NSPersistentContainer(name: "Notifications2" )
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save ()
            print("Data saved!!!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addIngr(name: String, calories: Int32, price: Int32, context: NSManagedObjectContext) {
        let ingr = Ingr(context: context)
        ingr.ingid = UUID()
        ingr.ingname = name
        ingr.ingcal = calories
        ingr.ingprice = price
        
        save (context: context)
    }
    
    func editIngr(ingr: Ingr, name: String, calories: Int32, price: Int32, context: NSManagedObjectContext) {
        ingr.ingname = name
        ingr.ingcal = calories
        ingr.ingprice = price
        
        save (context: context)
    }
    
    
    
    func addDish(name:String, description:String, i1:String, i2:String, i3:String, i4:String, i5:String, i6:String, i7:String, i8: String, i9:String, i10:String, m1:Int32, m2:Int32, m3:Int32, m4: Int32, m5: Int32, m6:Int32, m7:Int32, m8:Int32, m9:Int32, m10:Int32, context: NSManagedObjectContext){
        
        let dish = Dish(context: context)
        dish.dishID = UUID()
        dish.dishName = name
        dish.dishDesc = description
        dish.ing1 = i1
        dish.ing2 = i2
        dish.ing3 = i3
        dish.ing4 = i4
        dish.ing5 = i5
        dish.ing6 = i6
        dish.ing7 = i7
        dish.ing8 = i8
        dish.ing9 = i9
        dish.ing10 = i10
        dish.mass1 = m1
        dish.mass2 = m2
        dish.mass3 = m3
        dish.mass4 = m4
        dish.mass5 = m5
        dish.mass6 = m6
        dish.mass7 = m7
        dish.mass8 = m8
        dish.mass9 = m9
        dish.mass10 = m10
        
        save (context: context)
        
    }
    
    func editDish(dish: Dish, name:String, description:String, i1:String, i2:String, i3:String, i4:String, i5:String, i6:String, i7:String, i8: String, i9:String, i10:String, m1:Int32, m2:Int32, m3:Int32, m4: Int32, m5: Int32, m6:Int32, m7:Int32, m8:Int32, m9:Int32, m10:Int32, context: NSManagedObjectContext){
        
        
        
        dish.dishName = name
        dish.dishDesc = description
        dish.ing1 = i1
        dish.ing2 = i2
        dish.ing3 = i3
        dish.ing4 = i4
        dish.ing5 = i5
        dish.ing6 = i6
        dish.ing7 = i7
        dish.ing8 = i8
        dish.ing9 = i9
        dish.ing10 = i10
        dish.mass1 = m1
        dish.mass2 = m2
        dish.mass3 = m3
        dish.mass4 = m4
        dish.mass5 = m5
        dish.mass6 = m6
        dish.mass7 = m7
        dish.mass8 = m8
        dish.mass9 = m9
        dish.mass10 = m10
        
        save (context: context)
        
    }
    
    func addMeal(name: String, time:Date, context: NSManagedObjectContext) {
        let meal = TimeTable(context: context)
        meal.mealid = UUID()
        meal.nameDish = name
        meal.timeOfMeal = time
        
        save (context: context)
    }
    
    func editMeal(meal: TimeTable, name: String, time:Date, context: NSManagedObjectContext) {
        
        meal.nameDish = name
        meal.timeOfMeal = time
        
        save (context: context)
    }
    
    
    func addStock(name: String, amount: Int32, context: NSManagedObjectContext) {
        
        let curr = InStock(context: context)
        
        curr.inginst = name
        curr.amounthave = amount

        save (context: context)
    }
    
    func editStock(curr:InStock, name: String, amount: Int32, context: NSManagedObjectContext) {
        
        curr.inginst = name
        curr.amounthave = amount
        
        save (context: context)
    }
    

    
    
}
