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
            TabView {
                ForEach(pets) { pet in
                    VStack {
//Извлечь опциональную переменную и избавиться от !
                        if (pet.petPicture != nil) {
                            Image(uiImage: UIImage(data: pet.petPicture!)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .padding()
                                .contextMenu{MenuContext(item: pet)}
                            NavigationLink("\(pet.petName ?? "")", destination: NoteListScreen(selectedPet: pet))
                            Spacer()
                        } else {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 200, height: 300)
                            .background(Color.green)
                            .cornerRadius(30)
                            .scaledToFit()
                            .padding()
                            .contextMenu{MenuContext(item: pet)}
                        NavigationLink("\(pet.petName ?? "")", destination: NoteListScreen(selectedPet: pet))
                        Spacer()
                    }
                }
                }
             //   .onDelete(perform: deleteItems)
                
                VStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 200, height: 300)
                        .background(Color.green)
                        .cornerRadius(30)
                        .scaledToFit()
                        .padding()
                    NavigationLink(destination: AddPetScreen()) {
                        Text("Добавить питомца")
                    }
                    Spacer()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
