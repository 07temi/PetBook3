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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image(uiImage: image)
                    .resizable()
                    //.scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                //.clipShape(Circle())
                Text(name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
        .navigationBarHidden(true)
    }
}

//struct DMPetPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        DMPetPreview()
//    }
//}
