import Foundation
extension String {
    public var firstLowercased: String { prefix(1).lowercased() + dropFirst() }
    public var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
