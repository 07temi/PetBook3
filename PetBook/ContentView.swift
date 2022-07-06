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
    
    @State var showList = false
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach(pets) { pet in
                    VStack {
                        if let picture = pet.petPicture {
                            if let uiImage = UIImage(data: picture) {
                                Spacer()
                                NavigationLink(destination: DMTabViewScreen(selectedPet: pet)) {
                                    DMPetPreview(name: pet.petName ?? "", image: uiImage) }
                                .contextMenu{MenuContext(item: pet)}
                                Spacer()
                            }
    //                            Image(systemName: "camera")
    //                                .resizable()
    //                                .scaledToFit()
    //                                .frame(width: 200, height: 200)
    //                                .background(Color.clear)
    //                                .clipShape(Rectangle())
    //                                .padding()
    //                                .contextMenu{MenuContext(item: pet)}
    //                            NavigationLink("\(pet.petName ?? "")", destination: NoteListScreen(selectedPet: pet))
    //                            Spacer()
                            }else{
                                NavigationLink(destination: DMTabViewScreen(selectedPet: pet)) {
                                    DMPetPreview(name: pet.petName ?? "",
                                                 image: UIImage(imageLiteralResourceName: "camera")) }
                                .contextMenu{MenuContext(item: pet)}
                        }
                    }
                }
             //   .onDelete(perform: deleteItems)
                
                VStack {
                    Spacer()
                    NavigationLink(destination: AddPetScreen()) {
                        DMPetPreview(name: "New pet",
                                     image: UIImage(imageLiteralResourceName: "camera")) }
//                    Image(systemName: "star.fill")
//                        .resizable()
//                        .frame(width: 200, height: 300)
//                        .background(Color.green)
//                        .cornerRadius(30)
//                        .scaledToFit()
//                        .padding()
//                    NavigationLink(destination: AddPetScreen()) {
//                        Text("Добавить питомца")
//                    }
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
