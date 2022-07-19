//
//  DMPetPreview.swift
//  PetBook
//
//  Created by Артем Черненко on 05.07.2022.
//

import SwiftUI

struct DMPetPreview: View {
    
    var name: String
    var image: UIImage
    let screenSize = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack{
            Image(uiImage: image)
                .resizable()
            //.scaledToFill()
                .frame(width: screenSize - 10, height: screenSize - 10)
                .clipShape(Circle())
                .shadow(color: .blue, radius: 10, x: 0, y: 0)
            Text(name)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}
