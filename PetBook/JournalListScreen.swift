//
//  JournalListScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 04.07.2022.
//

import SwiftUI

struct JournalListScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var selectedPet: PetList

    var body: some View {

        VStack {
            List(selectedPet.journalsArray) { journal in
                Text(journal.journalTitle ?? "Unknown titlt")
                    .font(.system(size: 16))
            }
//            List {
//                ForEach(selectedPet.journalsArray) {journal in
//                    HStack {
//                        VStack {
//                            Text(journal.journalTitle ?? "Unknown title")
//                                .font(.system(size: 16))
//                        }
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
           // .navigationBarHidden(true)
//            .navigationBarTitle("\(selectedPet.petName ?? "")", displayMode: .inline)
//            .toolbar{
//                ToolbarItemGroup(placement:.navigationBarTrailing){
//                    Button(action: {addNote.toggle()}, label: {
//                        Label("add note",systemImage: "plus")
//                    })
//                }
//            }
        }
    }
//    }
    
    private func updateState(){
        viewContext.refreshAllObjects()
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { selectedPet.journalsArray[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

//struct NoteListScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteListScreen()
//    }
//}
