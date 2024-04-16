//
//  Notifications2App.swift
//  Notifications2
//
//  Created by Leo GGL on 16.04.2024.
//

import SwiftUI

@main
struct Notifications2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
