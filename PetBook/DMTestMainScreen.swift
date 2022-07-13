//
//  TestMainScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 20.06.2022.
//

import SwiftUI
import CoreData

struct DMTestMainScreen: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \PetList.petName, ascending: true)],
        animation: .default)
    private var pets: FetchedResults<PetList>
    
    var body: some View {
        TabView {
            ForEach(pets) { pet in
                if let image : UIImage = UIImage(data: pet.petPicture!) {
                    DMPetPreview(name: pet.petName ?? "", image: image)
                        .onTapGesture {
                            withAnimation {
                                viewRouter.currentPage = .page2(petTest: pet)
                            }
                        }
                        .contextMenu{MenuContext(item: pet)}
                } else {
                    DMPetPreview(name: pet.petName ?? "", image: UIImage(imageLiteralResourceName: "camera"))
                        .onTapGesture {
                            withAnimation {
                                viewRouter.currentPage = .page2(petTest: pet)
                            }
                        }
                        .contextMenu{MenuContext(item: pet)}
                }
            }
            
            DMPetPreview(name: "New pet", image: UIImage(imageLiteralResourceName: "camera"))
                .onTapGesture {
                    print("go to add new pet")
                    withAnimation {
                        viewRouter.currentPage = .page3
                    }
                }
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
