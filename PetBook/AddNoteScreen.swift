//
//  AddNoteScreen.swift
//  PetBook
//
//  Created by Артем Черненко on 09.06.2022.
//

import SwiftUI

struct AddNoteScreen: View {
    
    @State private var title: String = ""
    @State private var alarm: Bool = false
    @State private var active: Bool = false
    @State private var date: Date = Date()
    
    var body: some View {
        VStack{
            TextField("Заголовок", text: $title)
                .textFieldStyle(.roundedBorder)
            Toggle("Уведомление", isOn: $alarm)
            Toggle("Активировать", isOn: $active)
            DatePicker("Уведомить", selection: $date)
                .pickerStyle(.segmented)
//            (selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
        }.padding()
    }
}

struct AddNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteScreen()
    }
}
