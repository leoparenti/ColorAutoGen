import Foundation
import ArgumentParser

public struct AutoGenCommand: ParsableCommand {

    public init() { }

    public static var configuration = CommandConfiguration.colorAutoGen

    @Option(name: .shortAndLong, help: .variableHelp)
    var namevariable: String

    @Option(name: .shortAndLong, help: .assetsPathHelp)
    var assetsPath: String

    @Option(name: .shortAndLong, help: .outputHelp)
    var output: String

    @Option(name: .shortAndLong, help: .outputHelp)
    var version: String?

    @Option(name: .shortAndLong, help: .outputHelp)
    var type: String?

    @Option(name: .shortAndLong, help: .outputHelp)
    var suffix: String?

    public mutating func run() throws {
        let packageGenerator = PackageGenerator(namevariable: namevariable,
                                                packageSuffix: suffix,
                                                assetPath: assetsPath,
                                                output: output,
                                                version: version,
                                                type: type)
        try packageGenerator.run()
    }
}

extension ArgumentHelp {
    static var variableHelp: ArgumentHelp {
        return ArgumentHelp(ColorAGConstants.option.variableHelp,
                            discussion: ColorAGConstants.option.variableHelp)
    }
    static var assetsPathHelp: ArgumentHelp {
        return ArgumentHelp(ColorAGConstants.option.sourceHelp,
                            discussion: ColorAGConstants.option.sourceHelp)
    }
    
    static var outputHelp: ArgumentHelp {
        return ArgumentHelp(ColorAGConstants.option.outputHelp,
                            discussion: ColorAGConstants.option.outputHelp)
    }

    static var versionHelp: ArgumentHelp {
        return ArgumentHelp(ColorAGConstants.config.version,
                            discussion: ColorAGConstants.option.outputHelp)
    }
}

public extension CommandConfiguration{
    static var colorAutoGen: CommandConfiguration {
        CommandConfiguration(
            commandName: ColorAGConstants.config.name,
            abstract: ColorAGConstants.config.abstract,
            discussion: ColorAGConstants.config.discussion,
            version: ColorAGConstants.config.version)
    }
}
