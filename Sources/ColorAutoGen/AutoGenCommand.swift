import Foundation
import ArgumentParser

public struct AutoGenCommand: ParsableCommand {

    public init() { }

    public static var configuration = CommandConfiguration.colorAutoGen

    @Option(name: .shortAndLong, help: .variableHelp)
    var variable: String

    @Option(name: .shortAndLong, help: .sourceHelp)
    var source: String

    @Option(name: .shortAndLong, help: .outputHelp)
    var output: String

    public mutating func run() throws {
        let packageGenerator = PackageGenerator(variable: variable, source: source, output: output)
        try packageGenerator.run()
    }
}

extension ArgumentHelp {
    static var variableHelp: ArgumentHelp {
        return ArgumentHelp(ColorAGConstants.option.variableHelp,
                            discussion: ColorAGConstants.option.variableHelp)
    }
    static var sourceHelp: ArgumentHelp {
        return ArgumentHelp(ColorAGConstants.option.sourceHelp,
                            discussion: ColorAGConstants.option.sourceHelp)
    }
    
    static var outputHelp: ArgumentHelp {
        return ArgumentHelp(ColorAGConstants.option.outputHelp,
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
