//
//  AddPetScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 08.06.2022.
//

import SwiftUI

struct AddPetScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var name = ""
    @State private var type = ""
    
    private let types = ["Собака", "Кошка", "Хомяк"]
    
    var body: some View {
        Form {
            Section {
                Picker("Питомец", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                
                TextField("Имя", text: $name)
                    .disableAutocorrection(true)
                //выбор даты
            }
        }
        Button("Сохранить", action: savePet)
//        .toolbar {
//            Button("Сохранить", action: {} )
//        }
        
        
    }
    
    private func savePet() {
        withAnimation {
            let newItem = PetList(context: viewContext)
            newItem.id = UUID()
            newItem.petName = name
            newItem.petType = type

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct AddPetScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddPetScreen()
    }
}
