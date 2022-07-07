//
//  PetBookApp.swift
//  PetBook
//
//  Created by Артем Черненко on 08.06.2022.
//

import SwiftUI

@main
struct PetBookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
            DMTestMainScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
