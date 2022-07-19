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
            Button(role: .destructive, action: {delete(item: item)}) {
                Label("Удалить", systemImage: "trash")
            }
            
//            Button(role: .none, action: {delete(item: item)}) {
//                Label{
//                    Text("Text")
//                        .foregroundColor(.green)
//                } icon: {
//                    Image(systemName: "trash")
//                        .foregroundColor(.red)
//                }
//            }

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
