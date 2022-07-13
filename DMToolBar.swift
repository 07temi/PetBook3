//
//  DMToolBar.swift
//  PetBook
//
//  Created by Артем Черненко on 13.07.2022.
//

import SwiftUI

struct DMToolBar: View {
    
    let title: String
    let leftButtonAction: (() -> Void)
    let rightButtonAction: (() -> Void)
    
    var body: some View {
        HStack{
            Button("Назад", action: {
                self.leftButtonAction()
            } )
            .padding(.leading)
            Spacer()
            Text(title)
            Spacer()
            Button("Добавить", action: {
                self.rightButtonAction()
            } )
            .padding(.trailing)
        }
    }
}

//struct DMToolBar_Previews: PreviewProvider {
//    static var previews: some View {
//        DMToolBar(title: "title")
//    }
//}
