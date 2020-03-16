import Foundation
import SwiftCLI

let cli = CLI(name:"imgrz", version: "1.0.1")
cli.description = "Batch image resizing tool"

cli.parser.routeBehavior = .automatically(BatchResize())

let _ = cli.go()
