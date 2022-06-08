//
//  ContentView.swift
//  PetBook
//
//  Created by Артем Черненко on 08.06.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PetList.petName, ascending: true)],
        animation: .default)
    private var pets: FetchedResults<PetList>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(pets) { pet in
                        NavigationLink("\(pet.petName ?? "")", destination: NoteListScreen(selectedPet: pet))
                    }
                    .onDelete(perform: deleteItems)
                }
                NavigationLink(destination: AddPetScreen()) {
                    Text("Добавить питомца")
                }
            }
        }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
        }

    private func addItem() {
        withAnimation {
            let newItem = PetList(context: viewContext)
            newItem.id = UUID()
            newItem.petName = "Pet name"
            newItem.petType = "Pet type"

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { pets[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
