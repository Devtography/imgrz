//
//  URLExtensions.swift
//  
//
//  Created by Wing Chau on 04/03/2020.
//

import Foundation

extension URL {
    var isDirectory: Bool {
        let values = try? resourceValues(forKeys: [.isDirectoryKey])
        return values?.isDirectory ?? false
    }
}
