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
            Button(action: { self.leftButtonAction() }) {
                Image(systemName: "chevron.left")
            }
            .frame(width: 30)
            .padding(.leading)
            Spacer()
            Text(title)
            Spacer()
            Button(action: { self.rightButtonAction() }) {
                Image(systemName: "checkmark")
            }
            .frame(width: 30)
            .padding(.trailing)
        }
    }
}

//struct DMToolBar_Previews: PreviewProvider {
//    static var previews: some View {
//        DMToolBar(title: "title")
//    }
//}
