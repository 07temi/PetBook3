//
//  AddPetScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 08.06.2022.
//

import SwiftUI

struct AddPetScreen: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.managedObjectContext) private var viewContext
    @State private var petImage = UIImage()
    @State private var imagePicker = false
    @State private var name = ""
    @State private var type = ""
    
    let types = ["Собака", "Кошка", "Хомяк"]
    
    var body: some View {
        DMToolBar(title: "Tect") {
            print("left button")
        } rightButtonAction: {
            print("right button")
        }

        Form{
            HStack{
                Text("Питомец")
                Spacer()
                Picker("", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }.pickerStyle(.menu)
            }
            TextField("Имя", text: $name)
                .disableAutocorrection(true)
            Image(uiImage: petImage)
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.gray,lineWidth: 5))
                .onTapGesture {
                    imagePicker.toggle()
                }
                .sheet(isPresented: $imagePicker){
                    PhotoPicker(petPicture: $petImage)
                }
            Button("Сохранить") {
                savePet()
                withAnimation {
                    viewRouter.currentPage = .page1
                }
            }
            Button("Отменить") {
                withAnimation {
                    viewRouter.currentPage = .page1
                }
            }
        }
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
