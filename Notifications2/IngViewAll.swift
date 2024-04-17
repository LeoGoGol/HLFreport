//
//  IngViewAll.swift
//  HLTF
//
//  Created by Leo GGL on 15.04.2024.
//

import SwiftUI
import CoreData

struct IngrView: View {
    @State private var ingredients: [Ingr] = []

    var body: some View {
        List(ingredients) { ingredient in
            VStack(alignment: .leading) {
                Text(ingredient.ingname ?? <#default value#>)
                    .font(.headline)
                Text("Price: \(ingredient.ingprice), Calories: \(ingredient.ingcal)")
                    .font(.subheadline)
            }
        }
        .onAppear {
           
            fetchIngredients()
        }
    }

    func fetchIngredients() {
        
        ingredients = DatCntrl.shared.getAllIngredients()
    }
}

struct IngrView_Previews: PreviewProvider {
    static var previews: some View {
        IngrView()
    }
}
