import Foundation
import ArgumentParser
import Files

protocol Generator {
    func generatePackage(variable: String,
                         sourceXCAssetPath: String,
                         outputFilePath: String) throws
}

struct PackageGenerator {
    private let variable: String
    private let source: String
    private let output: String


    init(variable: String, source: String, output: String) {
        self.variable = variable
        self.source = source
        self.output = output
    }

    func run() throws {
        do {
            try ColorsPackageGenerator().generatePackage(variable: variable,
                                                         sourceXCAssetPath: source,
                                                         outputFilePath: output)
        } catch let error  {
            print("error:\(error)")
            throw error
        }
        print("Successfuly generated \(variable.capitalized)Color Package at the provided path")
    }
}

extension ValidationError {
    static var invalidSourcePath = ValidationError("Could not find a valid source at the provided path")
    static var invalidOutputPath = ValidationError("Could not create or find the output file")
}
