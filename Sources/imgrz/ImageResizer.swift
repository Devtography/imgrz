//
//  ImageResizer.swift
//  
//
//  Created by Wing Chau on 28/02/2020.
//

import Foundation
import SwiftGD

class ImageResizer {
    private init() {}
    
    static func run(source: URL, destination dest: URL, resizeTo px: Int) {
        guard source.isFileURL else {
            print("Invaild source path: \(source.absoluteString)")
            
            return
        }
        
        guard dest.isFileURL else {
            print("Invalid destination path: \(dest.absoluteString)")
            
            return
        }
        
        guard let image = Image(url: source) else {
            print("Cannot read image: \(source.absoluteString)")
            
            return
        }
        
        var resizedImage: Image?
        
        if image.size.height > image.size.width {
            resizedImage = image.resizedTo(height: px)
        } else {
            resizedImage = image.resizedTo(width: px)
        }
        
        guard resizedImage?.write(to: dest) ?? false else {
            print("Failed to save image at \(dest.absoluteString)")
            
            return
        }
    }
}
