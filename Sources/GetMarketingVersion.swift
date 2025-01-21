import Foundation
import ArgumentParser

@main
struct GetMarketingVersion: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "get-marketing-version",
        abstract: "Prints the value of the 'CFBundleShortVersionString' key in the provided plist file."
    )
    
    @Argument(
        help: "A plist file.",
        completion: .file(), transform: URL.init(fileURLWithPath:))
    var inputFile: URL
    
    mutating func run() throws {
        let fileHandle = try FileHandle(forReadingFrom: inputFile)
        
        guard
            let data = try? fileHandle.readToEnd(),
            let plist = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil),
            let dict = plist as? [String: Any]
        else {
            throw ValidationError("Invalid plist '\(inputFile)'.")
        }

        guard let val = dict["CFBundleShortVersionString"] as? String else { throw PlistError.notFound(key: "CFBundleShortVersionString") }
        print(val)
    }
}

enum PlistError: LocalizedError {
    case invalidData(URL)
    case notFound(key: String)
    
    var errorDescription: String? {
        switch self {
        case .invalidData(let url):
            return "Failed to read data from file '\(url.path)'."
        case .notFound(let key):
            return "The '\(key)' key could not be found."
        }
    }
}
