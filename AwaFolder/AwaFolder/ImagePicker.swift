//
//  ImagePicker.swift
//  AwaFolder
//
//  Created by tiking on 2022/09/24.
//

import SwiftUI

struct Imagepicker : UIViewControllerRepresentable {
    
    @Binding var show:Bool
    @Binding var image:Data
    @Binding var text: String
    var sourceType:UIImagePickerController.SourceType
 
    func makeCoordinator() -> Imagepicker.Coodinator {
        
        return Imagepicker.Coordinator(parent: self)
    }
      
    func makeUIViewController(context: UIViewControllerRepresentableContext<Imagepicker>) -> UIImagePickerController {
        
        let controller = UIImagePickerController()
        controller.sourceType = sourceType
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Imagepicker>) {
    }
    
    class Coodinator: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
        var parent : Imagepicker
        
        init(parent : Imagepicker){
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let data = image.pngData()
            guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }
            print(imageData)
            self.parent.text = String(data: imageData.base64EncodedData(), encoding: .utf8)!
            print(parent.text)
            self.parent.image = imageData
            self.parent.show.toggle()
        }
    }
}
