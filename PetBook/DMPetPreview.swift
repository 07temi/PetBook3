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
                .frame(width: screenSize, height: screenSize)
                .clipShape(Circle())
            Text(name)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}

//struct DMPetPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        DMPetPreview()
//    }
//}
