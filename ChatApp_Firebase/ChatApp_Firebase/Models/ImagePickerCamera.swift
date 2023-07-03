//
//  ImagePicker.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-24.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePickerCamera: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var image: UIImage?
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: ImagePickerCamera
        
        init(_ picker: ImagePickerCamera){
            self.picker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.picker.image = uiImage
            }
            
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: .random())
        }
    }
    func makeCoordinator() -> ImagePickerCamera.Coordinator {
        return ImagePickerCoordinator(self)
    }
    
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
