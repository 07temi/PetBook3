//
//  AddJournalScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 04.07.2022.
//

import SwiftUI

struct AddJournalScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var selectedPet: PetList
    
    @State private var title: String = ""
    
    var body: some View {
        ScrollView {
            Text("Add journal")
                .font(.title)
                .padding(.top)
            VStack {
                TextField("Заголовок", text: $title)
                    .textFieldStyle(.roundedBorder)
                Button("Сохранить", action: {
                    saveJournal()
                    dismiss()
                })
                    .padding(.top)
                
            }
            .padding()
        }
    }
    
    private func saveJournal(){
        let newJournal = JournalList(context: viewContext)
        newJournal.id = UUID()
        newJournal.journalTitle = title
        newJournal.journalToPet = selectedPet
        viewContext.refreshAllObjects()
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}
