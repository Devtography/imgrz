//
//  BatchResize.swift
//  
//
//  Created by Wing Chau on 28/02/2020.
//

import Foundation
import SwiftCLI
import Progress

class BatchResize: Command {
    
    let name = "batch"
    
    @Param var source: String
    @Param var destination: String
    @Param var size: Int
    
    @Flag("-f", "--force",
          description: "Overwrites existing file(s)")
    var force: Bool
    @Flag("-r", description: "Processes sub-folders recursively")
    var recursive: Bool
    
    let fm = FileManager.default
    var sourceUrl: URL!
    var outUrl: URL!

    func execute() throws {
        self.sourceUrl = URL(fileURLWithPath: source, isDirectory: true)
        self.outUrl = URL(fileURLWithPath: destination, isDirectory: true)
        
        let contents = try fm.contentsOfDirectory(
            at: sourceUrl, includingPropertiesForKeys: [])
        
        var imageUrls: [URL] = []

        if self.recursive {
            imageUrls = try self.recursiveImageSearch()
        } else {
            for url in contents {
                if url.pathExtension == "png" || url.pathExtension == "jpg" {
                    imageUrls.append(url)
                }
            }
        }
        
        self.batchResize(images: imageUrls)
    }
    
    private func recursiveImageSearch() throws -> [URL] {
        let contentSubPaths = try fm.subpathsOfDirectory(atPath: self.source)
        
        var result: [URL] = []
        
        for path in contentSubPaths {
            let url = URL(fileURLWithPath: "\(self.source)/\(path)")
            
            if url.pathExtension == "png" || url.pathExtension == "jpg" {
                result.append(url)
            }
        }

        return result
    }
    
    private func batchResize(images: [URL]) {
        for img in Progress(images) {
            let dest = constructOutPath(from: img)

            if self.force {
                try? fm.removeItem(at: dest)
            }
            
            if self.recursive {
                let dirPath = dest.deletingLastPathComponent()
                
                try? fm.createDirectory(
                    at: dirPath, withIntermediateDirectories: true
                )
            }

            ImageResizer.run(
                source: img,
                destination: dest,
                resizeTo: self.size
            )
        }
    }
    
    private func constructOutPath(from source: URL) -> URL {
        var pathComs = source.pathComponents
        pathComs.removeAll(where: self.sourceUrl.pathComponents.contains)
        
        var outPath: URL = self.outUrl
        for component in pathComs {
            outPath.appendPathComponent(component)
        }
        
        return outPath
    }
}
