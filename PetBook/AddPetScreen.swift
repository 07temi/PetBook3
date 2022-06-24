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
    @State private var petImage = UIImage()
    @State private var imagePicker = false
    @State private var name = ""
    @State private var type = ""
    
    private let types = ["Собака", "Кошка", "Хомяк"]
    
    var body: some View {
        Form {
            Section {
                VStack{
                    Image(uiImage: petImage)
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.gray,lineWidth: 5))
                    Button(action: {
                        imagePicker.toggle()
                    }, label: {
                        Text("Add Image")
                    })
                        .sheet(isPresented: $imagePicker){
                            PhotoPicker(petPicture: $petImage)
                        }
                }
                
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
            newItem.petPicture = petImage.pngData()
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
