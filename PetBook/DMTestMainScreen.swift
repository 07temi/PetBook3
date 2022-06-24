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
                ZStack {
                    if let picture = pet.petPicture {
                        if let uiImage = UIImage(data: picture) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .ignoresSafeArea()
                                    .frame(width: 400, height: 800)
                                    //.aspectRatio(contentMode: .fill)
                                    .opacity(0.5)
                        } else {
                            Image(systemName: "camera")
                        }
                    }
                    Text("PetName")
                }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct TestMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        DMTestMainScreen()
    }
}
