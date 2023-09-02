// generated with ColorAutogen
// Usage: Color.library.redFerrari
import SwiftUI

@available(iOS 13.0, *)
public extension Color {
    struct LibraryColor {
        public static let backgroundCard = Color.create(.backgroundCard)
        public static let dark = Color.create(.dark)
        public static let green = Color.create(.green)
        public static let redFerrari = Color.create(.redFerrari)
        public static let white = Color.create(.white)

        public static let allColors: [Color] = [
            backgroundCard, dark, green, redFerrari, white]
        }

    static var library: LibraryColor.Type {
        LibraryColor.self
    }
}

@available(iOS 13.0, *)
internal extension Color {
    static func create(_ key: ColorKey) -> Color {
        Color(key.rawValue, bundle: Bundle.module)
    }
}
