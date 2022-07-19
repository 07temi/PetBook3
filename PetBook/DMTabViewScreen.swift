//
//  DMTabViewScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 20.06.2022.
//

import SwiftUI

struct DMTabViewScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject var selectedPet: PetList
    @State private var selectedTab = 0
    @State private var addNote = false
    @State private var addJournal = false
    private var namePet: String {
        let name = selectedPet.petName ?? "Unknown name"
        return name
    }
    
    var body: some View {
        DMToolBar(title: "Test") {
            withAnimation {
                viewRouter.currentPage = .page1
            }
        } rightButtonAction: {
            AddActionForTab(tab: selectedTab)
        }
        
        TabView(selection: $selectedTab){
            NoteListScreen(selectedPet: selectedPet)
                .tabItem {
                    Label("Напоминания", systemImage: "person")
                }
                .tag(0)
            
            JournalListScreen(selectedPet: selectedPet)
                .tabItem {
                    Label("Дневник", systemImage: "person")
                }
                .tag(1)
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
