//
//  ImagePicker.swift
//  
//
//  Created by lonnie on 2020/8/20.
//
#if !os(macOS)

import UIKit

public class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public enum Result {
        
        case success([UIImagePickerController.InfoKey : Any])
        
        case cancel
    
    }
    
    private weak var host: UIViewControllerConvertable?
    
    private var pickerViewController: UIImagePickerController
    
    private var completion: (Result)->Void
    
    public init(host: UIViewControllerConvertable,
                sourceType: UIImagePickerController.SourceType = .photoLibrary,
                allowsEditing: Bool = false,
                completion: @escaping (Result)->Void = {_ in }) throws {
        self.host = host
        self.pickerViewController = UIImagePickerController()
        self.completion = completion
        super.init()
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else { throw UIError.imageSourceTypeNotAvailable }
        self.pickerViewController.allowsEditing = allowsEditing
        self.pickerViewController.sourceType = sourceType
        self.pickerViewController.delegate = self
    }
    
    public func show() {
        host?.toViewController().present(self.pickerViewController, animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        pickerViewController.dismiss(animated: true, completion: { [weak self] in
            self?.completion(.success(info))
        })
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        pickerViewController.dismiss(animated: true, completion: { [weak self] in
            self?.completion(.cancel)
        })
    }
    
}
public extension Dictionary where Key == UIImagePickerController.InfoKey {
    
    var originalImage: UIImage? { self[.originalImage] as? UIImage }

    var editedImage: UIImage? { self[.editedImage] as? UIImage }
    
    var cropRect: CGRect? { self[.cropRect] as? CGRect }
 
}
#endif
