//
//  UIImage+Extension.swift
//  
//
//  Created by lonnie on 2020/8/23.
//

#if canImport(UIKit)
import UIKit
public extension UIImage {
    
    static func fromBase64(_ base64String: String) -> UIImage? {
        let items = base64String.components(separatedBy: "base64,")
        if
            let item = items.last,
            let data = Data(base64Encoded: item),
            let image = UIImage(data: data) {
            return image
        }
        return nil
    }

    func crippedImage(size: CGSize) -> UIImage? {
        let scale = Screen.main.nativeScale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size.width / scale, height: size.height / scale), true, scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width / scale, height: size.height / scale))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
#endif
