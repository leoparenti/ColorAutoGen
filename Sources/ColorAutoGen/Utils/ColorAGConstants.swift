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
        static let versionHelp = "set version string printed for autogen header"
        static let typeHelp = "only color for now"
        static let suffixHelp = "default suffix: 'Color' "
    }
}

enum AutoGenType: String {
    case color = "c"
    case image = "i"
    case localise = "l"
}

extension ColorAGConstants {
    static var config: Config.Type {
        Config.self
    }
    static var option: Option.Type {
        Option.self
    }
}
