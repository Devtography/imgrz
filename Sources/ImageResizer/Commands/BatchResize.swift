//
//  BatchResize.swift
//  
//
//  Created by Wing Chau on 28/02/2020.
//

import Foundation
import SwiftCLI

class BatchResize: Command {
    
    let name = "batch"
    
    @Param var source: String
    @Param var destination: String
    @Param var size: Int
    
    @Flag("-f", "--force",
          description: "Overwrites existing file(s)")
    var force: Bool

    func execute() throws {
        let sourceUrl = URL(fileURLWithPath: source, isDirectory: true)
        let outUrl = URL(fileURLWithPath: destination, isDirectory: true)
        
        let contents = try FileManager.default.contentsOfDirectory(
            at: sourceUrl, includingPropertiesForKeys: [])
        
        var imageUrls: [URL] = []

        for url in contents {
            if url.pathExtension == "png" || url.pathExtension == "jpg" {
                imageUrls.append(url)
            }
        }
        
        for item in imageUrls {
            var imagePathComs = item.pathComponents
            imagePathComs.removeAll(where: sourceUrl.pathComponents.contains)
            
            var dest = outUrl
            for com in imagePathComs {
                dest.appendPathComponent(com)
            }
            
            if force {
                if try dest.checkResourceIsReachable() {
                    try FileManager.default.removeItem(at: dest)
                }
            }
            
            ImageResizer.run(source: item, destination: dest, resizeTo: size)
        }
    }
}
