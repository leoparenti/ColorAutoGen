import Foundation
struct ColorPackage {
    internal init(path: String, variable: String) {
        self.path = path
        self.variable = variable.normalize.firstLowercased
    }

    let path: String
    let variable: String
}

extension ColorPackage {
    var url: URL? {
        URL(string: path)
    }
    var folderPath: String {
        path + "/\(name)"
    }
    var name: String {
        variable.firstUppercased + "Color"
    }
    var colorKeyFile: String {
        path + "/\(name)/Sources/\(name)/ColorKey.swift"
    }
    var assetPath: String {
        path + "/\(name)/Sources/\(name)/Colors.xcassets"
    }
    var colorClassPath: String {
        path + "/\(name)/Sources/\(name)/Color+.swift"
    }

    var uiColorPath: String {
        path + "/\(name)/Sources/\(name)/UIColor+.swift"
    }
    var xcTestPath: String {
        path + "/\(name)/Tests/\(name)Tests/\(name)Tests.swift"
    }

    var templateSuffix: String {
        "Template"
    }
}
