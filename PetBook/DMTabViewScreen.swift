//
//  DMTabViewScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 20.06.2022.
//

import SwiftUI

struct DMTabViewScreen: View {
    
    @StateObject var selectedPet: PetList
    
    var body: some View {
        TabView {
            NoteListScreen(selectedPet: selectedPet)
                .tabItem {
                    Image(systemName: "clock")
                    Text("Напоминания")
                }
            Text("Journal")
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                    Text("Дневник")
                }
            Text("Journal")
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                    Text("Дневник")
                }
        }
    }
}

//struct DMTabViewScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DMTabViewScreen()
//    }
//}
