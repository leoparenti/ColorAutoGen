// generated with ColorAutogen
// Usage: UIColor.library.backgroundCard
import UIKit

public extension UIColor {
    struct LibraryColor {
        public static let backgroundCard = UIColor.create(.backgroundCard).notNilOrClear
        public static let dark = UIColor.create(.dark).notNilOrClear
        public static let green = UIColor.create(.green).notNilOrClear
        public static let redFerrari = UIColor.create(.redFerrari).notNilOrClear
        public static let white = UIColor.create(.white).notNilOrClear

        public static let allColors: [UIColor] = [
            backgroundCard, dark, green, redFerrari, white]
        }

    static var library: LibraryColor.Type {
        LibraryColor.self
    }
}

extension UIColor {
    static func create(_ key: ColorKey) -> UIColor? {
        let color = UIColor(named: key.rawValue, in: Bundle.module, compatibleWith: nil)
        guard let color else {
            debugPrint("color \(key.rawValue) not in Colors.xcasset")
            return nil
        }

        return color
    }
}

extension UIColor? {
    var notNilOrClear: UIColor {
        self ?? .clear
    }
}
