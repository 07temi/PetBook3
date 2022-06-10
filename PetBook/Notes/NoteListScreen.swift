//
//  NoteListScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 08.06.2022.
//

import SwiftUI

struct NoteListScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var selectedPet: PetList

    var body: some View {
        VStack {
            List {
                ForEach(selectedPet.notesArray) {note in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(note.noteTitle ?? "Unknown title")
                                .font(.system(size: 16))
                            Text("\(note.noteDate?.formatted(date: .long, time: .omitted) ?? "")")
                                .font(.system(size: 10))
                        }
                        Spacer()
                        
                        Image(systemName: "bell.square")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(note.noteAlarm ? .green : .gray)
                            .onTapGesture {
                                note.noteAlarm.toggle()
                                updateState()
                            }
                        Image(systemName: "checkmark.square")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(note.noteActive ? .green : .gray)
                            .onTapGesture {
                                note.noteActive.toggle()
                                updateState()
                            }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            NavigationLink(destination: AddNoteScreen(selectedPet: selectedPet)) {
                Text("Добавить заметку")
            }
        }
    }
    
    private func updateState(){
        viewContext.refreshAllObjects()
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func addNewNote(){
        let newNote = NotesList(context: viewContext)
        newNote.id = UUID()
        newNote.noteTitle = "Note title"
        newNote.noteActive = true
        newNote.noteDate = Date()
        newNote.noteToPet = selectedPet
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
            offsets.map { selectedPet.notesArray[$0] }.forEach(viewContext.delete)
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
