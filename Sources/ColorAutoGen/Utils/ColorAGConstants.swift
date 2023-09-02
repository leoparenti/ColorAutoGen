import Foundation

struct ColorAGConstants {
    public struct Config {
        static let name = "color-autogen"
        static let abstract = "abstract"
        static let discussion = "discussion"
        static let version = "0.9.0"
    }
    public struct Option {
        static let sourceHelp = "Path of .xcassets to generate the package"
        static let outputHelp = "Path to create Package"
        static let variableHelp = "used for UIColor.<variable>.nameColor, package name '<Variable>Color'"
    }
}

extension ColorAGConstants {
    static var config: Config.Type {
        Config.self
    }
    static var option: Option.Type {
        Option.self
    }
}
