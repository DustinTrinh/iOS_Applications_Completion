//
//  ImagePickerLibrary.swift
//  ChatApp_Firebase
//
//  Created by DustyTheCutie on 2023-06-24.
//

import Foundation
import SwiftUI
import PhotosUI

struct ImagePickerLibrary : UIViewControllerRepresentable {
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Tell the picker to go away
            picker.dismiss(animated: true)

            // Exit if no selection was made
            guard let provider = results.first?.itemProvider else { return }

            // If this has an image we can use, use it
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
        
            var parent: ImagePickerLibrary

            init(_ parent: ImagePickerLibrary) {
                self.parent = parent
            }
        }
    
    @Binding var image: UIImage?
    
    func makeCoordinator() -> ImagePickerLibrary.Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator

        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }
}
