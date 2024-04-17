//
//  AddIngrView.swift
//  HLTF
//
//  Created by Leo GGL on 07.04.2024.
//

import SwiftUI

struct AddIngrView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismm
    
    @State private var name = ""
    @State private var calories:Double = 0
    @State private var price:Double = 0
    
    var body: some View {
        Form{
            Section{
                
                TextField("Ingridient name:", text: $name)
                
                VStack{
                    Text("Calories in 100 grams: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 5)
                }
                
                VStack{
                    Text("Price for 100 grams: \(Int(price))")
                    Slider(value: $price, in: 0...1000, step: 1)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        
                        DatCntrl().addIngr(name: name, calories: Int32(calories), price: Int32(price), context: managedObjContext)
                        dismm()
                        
                        presentationMode.wrappedValue.dismiss() 
                        
                        
                        
                    }
                    Spacer()
                }
                
                
            }
        }
    }
}

#Preview {
    AddIngrView()
}
