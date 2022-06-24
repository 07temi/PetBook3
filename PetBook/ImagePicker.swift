//
//  ImagePicker.swift
//  PetBook
//
//  Created by Артем Черненко on 15.06.2022.
//

import Foundation
import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var petPicture: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let photoPicker: PhotoPicker
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.petPicture = image
            } else {
                
            }
            picker.dismiss(animated: true)
        }
    }
}


//@Binding var selectedImage:UIImage
//@Environment(\.dismiss) private var dismiss
//
//func makeCoordinator() -> Coordinator {
//    Coordinator(self)
//}
//
//class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
//    var parent:ImagePickerView
//
//    init(_ parent:ImagePickerView) {
//        self.parent = parent
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
//            parent.selectedImage = image
//        }
//        parent.dismiss()
//    }
//}
//
//func makeUIViewController(context: Context) -> some UIViewController {
//    let imagePicker = UIImagePickerController()
//    imagePicker.allowsEditing = false
//    imagePicker.sourceType = .photoLibrary
//    imagePicker.delegate = context.coordinator
//    return imagePicker
//}
//
//func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//}
