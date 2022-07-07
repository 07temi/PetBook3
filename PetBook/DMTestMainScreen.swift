//
//  TestMainScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 20.06.2022.
//

import SwiftUI
import CoreData

struct DMTestMainScreen: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PetList.petName, ascending: true)],
        animation: .default)
    private var pets: FetchedResults<PetList>
    
    var body: some View {
        TabView {
            ForEach(pets) { pet in
                    NavigationLink(destination: DMTabViewScreen(selectedPet: pet)) {
                        DMPetPreview(name: pet.petName ?? "", image: UIImage(imageLiteralResourceName: "camera")) }
                    .contextMenu{MenuContext(item: pet)}
                }
                //Text(pet.petName ?? "NONAME")
            }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}


//struct TestMainScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DMTestMainScreen()
//    }
//}
