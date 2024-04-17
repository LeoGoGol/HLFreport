//
//  AddStockView.swift
//  Notifications2
//
//  Created by Leo GGL on 16.04.2024.
//

//
//  AddIngrView.swift
//  HLTF
//
//  Created by Leo GGL on 07.04.2024.
//

import SwiftUI

struct AddStockView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismm
    
    @State private var name = ""
    @State private var calories:Double = 50

    
    var body: some View {
        Form{
            Section{
                
                TextField("Ingridient name:", text: $name)

                
                VStack{
                    Text("Amount in stock in grams: \(Int(calories))")
                    Slider(value: $calories, in: 0...5000, step: 5)
                }
                
                
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        
                        DatCntrl().addStock(name: name, amount: Int32(calories), context: managedObjContext)
                        dismm()
                        name = ""
                        calories = 50
                        presentationMode.wrappedValue.dismiss()
                        
                        
                        
                    }
                    Spacer()
                }
                
                
            }
        }
    }
}

#Preview {
    AddStockView()
}
