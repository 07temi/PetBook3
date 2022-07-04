//
//  DMTabViewScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 20.06.2022.
//

import SwiftUI

struct DMTabViewScreen: View {
    
    @StateObject var selectedPet: PetList
    @State private var selectedTab = 0
    @State private var addNote = false
    @State private var addJournal = false
    private var namePet: String {
        let name = selectedPet.petName ?? "Unknown name"
        return name
    }
    
    var body: some View {
        TabView(selection: $selectedTab){
            NoteListScreen(selectedPet: selectedPet)
                .tabItem {
                    Label("Напоминания", systemImage: "person")
                }.navigationTitle(namePet)
                .tag(0)
            
            
            JournalListScreen(selectedPet: selectedPet)
                .tabItem {
                    Label("Дневник", systemImage: "person")
                }.navigationTitle(namePet)
                .tag(1)
        }
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Button(action: {AddActionForTab(tab: selectedTab)}, label: {
                    Label("add note",systemImage: "plus")
                })
            }
        }
        .sheet(isPresented: $addNote){
            AddNoteScreen(selectedPet: selectedPet)
        }
        .sheet(isPresented: $addJournal){
            AddJournalScreen(selectedPet: selectedPet)
        }
    }
    
    private func AddActionForTab(tab: Int){
        switch tab {
        case 0: addNote.toggle()
        default:
            addJournal.toggle()
        }
    }
}


//struct DMTabViewScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DMTabViewScreen()
//    }
//}
