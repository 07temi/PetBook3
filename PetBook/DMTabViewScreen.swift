//
//  DMTabViewScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 20.06.2022.
//

import SwiftUI

struct DMTabViewScreen: View {
    var body: some View {
        TabView{
            Text("Test")
                .tabItem {
                    Label("tab_1", systemImage: "person")
                }
        }
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Button(action: {}, label: {
                    Label("add note",systemImage: "plus")
                })
            }
        }
    }
}


//struct DMTabViewScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DMTabViewScreen()
//    }
//}
