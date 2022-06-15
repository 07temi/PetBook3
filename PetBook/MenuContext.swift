//
//  Menu.swift
//  PetBook
//
//  Created by Артем Черненко on 15.06.2022.
//

import SwiftUI
import CoreData

struct MenuContext: View {
    @Environment(\.managedObjectContext) private var viewContext
    var item: NSManagedObject
    
    var body: some View {
        Group {
            Button("Удалить", action:{delete(item: item)})
        }
    }
    private func delete(item: NSManagedObject){
        viewContext.delete(item)
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
