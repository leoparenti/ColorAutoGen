import Foundation
extension String {

    public var normalize: String {
        self.replacingOccurrences(of:" ", with: "-")
            .replacingOccurrences(of:".", with: "-")
            .components(separatedBy: "-").map { $0.firstUppercased }
            .joined().firstLowercased
    }

    public var firstLowercased: String { prefix(1).lowercased() + dropFirst() }
    public var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
