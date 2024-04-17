//
//  AddDishView.swift
//  HLTF
//
//  Created by Leo GGL on 15.04.2024.
//

import SwiftUI

struct AddDishView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismm
    
    @State private var name = ""
    @State private var description = ""
    
    @State private var ing1 = ""
    @State private var ing2 = ""
    @State private var ing3 = ""
    @State private var ing4 = ""
    @State private var ing5 = ""
    @State private var ing6 = ""
    @State private var ing7 = ""
    @State private var ing8 = ""
    @State private var ing9 = ""
    @State private var ing10 = ""
    
    @State private var mass1:Double = 0
    @State private var mass2:Double = 0
    @State private var mass3:Double = 0
    @State private var mass4:Double = 0
    @State private var mass5:Double = 0
    @State private var mass6:Double = 0
    @State private var mass7:Double = 0
    @State private var mass8:Double = 0
    @State private var mass9:Double = 0
    @State private var mass10:Double = 0
    
    @State private var calories:Double = 0
    @State private var price:Double = 0
    
    var body: some View {
        Form{
            Section{
                
                TextField("Dish name:", text: $name)
                
                TextField("Type in the steps of cooking here", text: $description)
                
                TextField("Name of the ingridient no. 1", text: $ing1)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass1))")
                    Slider(value: $mass1, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 2", text: $ing2)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass2))")
                    Slider(value: $mass2, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 3", text: $ing3)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass3))")
                    Slider(value: $mass3, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 4", text: $ing4)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass4))")
                    Slider(value: $mass4, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 5", text: $ing5)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass5))")
                    Slider(value: $mass5, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 6", text: $ing6)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass6))")
                    Slider(value: $mass6, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 7", text: $ing7)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass7))")
                    Slider(value: $mass7, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 8", text: $ing8)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass8))")
                    Slider(value: $mass8, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 9", text: $ing9)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass9))")
                    Slider(value: $mass9, in: 0...1000, step: 5)
                }
                
                TextField("Name of the ingridient no. 10", text: $ing10)
                
                VStack{
                    Text("Mass of the ingridient \(Int(mass10))")
                    Slider(value: $mass10, in: 0...1000, step: 5)
                }
                
                
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        
                        DatCntrl().addDish(name: name, description: description, i1: ing1, i2: ing2, i3: ing3, i4: ing4, i5: ing5, i6: ing6, i7: ing7, i8: ing8, i9: ing9, i10: ing10, m1: Int32(mass1), m2: Int32(mass2), m3: Int32(mass3),  m4: Int32(mass4), m5: Int32(mass5), m6: Int32(mass6), m7: Int32(mass7), m8: Int32(mass8),  m9: Int32(mass9),  m10: Int32(mass10), context: managedObjContext)
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
    AddDishView()
}
