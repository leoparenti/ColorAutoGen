import Foundation
struct PackageInfo {

    let path: String
    let variable: String
    let suffix: String
    let version: String
    let type: AutoGenType

    internal init(path: String,
                  variable: String,
                  suffix: String,
                  version: String,
                  type: String) {
        self.path = path
        self.variable = variable.normalize.firstLowercased
        self.suffix = suffix
        self.version = version
        self.type = AutoGenType.color
    }
}

extension PackageInfo {
    var url: URL? {
        URL(string: path)
    }
    var folderPath: String {
        path + "/\(name)"
    }
    var name: String {
        variable.firstUppercased + suffix
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
}
