//
//  AddNoteScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 09.06.2022.
//

import SwiftUI

struct AddNoteScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var selectedPet: PetList
    
    @State private var title: String = ""
    @State private var alarm: Bool = false
    @State private var active: Bool = false
    @State private var date: Date = Date()
    
    var body: some View {
        ScrollView {
            Text("Add note")
                .font(.title)
                .padding(.top)
            VStack {
                TextField("Заголовок", text: $title)
                    .textFieldStyle(.roundedBorder)
                Toggle("Уведомление", isOn: $alarm)
                Toggle("Активировать", isOn: $active)
                DatePicker("Уведомить", selection: $date)
                    .datePickerStyle(.compact)
                Button("Сохранить", action: {
                    saveNote()
                    dismiss()
                })
                    .padding(.top)
                
            }
            .padding()
        }
//        .toolbar{
//            ToolbarItemGroup(placement:.navigationBarTrailing){
//                Button(action: {saveNote()}, label: {
//                    Label("add note",systemImage: "checkmark")
//                })
//            }
//        }
    }
    
    private func saveNote(){
        let newNote = NotesList(context: viewContext)
        newNote.id = UUID()
        newNote.noteTitle = title
        newNote.noteActive = active
        newNote.noteAlarm = alarm
        newNote.noteDate = date
        newNote.noteToPet = selectedPet
        viewContext.refreshAllObjects()
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Fatal error \(nsError), \(nsError.userInfo)")
        }
    }
}

//struct AddNoteScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNoteScreen()
//    }
//}
