struct ColorString {
    let key: String

    internal init(_ key: String) {
        self.key = key
    }

    var name: String {
        key.normalize
    }
}

extension String {
    var normalize: String {
        replacingOccurrences(of:" ", with: "-")
            .replacingOccurrences(of:".", with: "-")
            .replacingOccurrences(of:"_", with: "-")
            .components(separatedBy: "-").map { $0.firstUppercased }
            .joined().firstLowercased
    }
}

