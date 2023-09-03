import Foundation
import ArgumentParser
import Files

protocol Generator {
    func generatePackage(namevariable: String,
                         packageSuffix: String,
                         assetPath: String,
                         outputFilePath: String,
                         version: String,
                         type: String) throws
}

struct PackageGenerator {
    private let namevariable: String
    private let assetPath: String
    private let output: String
    private let version: String
    private let type: String
    private let packageSuffix: String

    init(namevariable: String,
         packageSuffix: String?,
         assetPath: String,
         output: String,
         version: String?,
         type: String?) {
        self.namevariable = namevariable
        self.assetPath = assetPath
        self.output = output
        self.version = version ?? "1.0.0"
        self.type = type ?? "color"
        self.packageSuffix = packageSuffix ?? "Color"
    }

    func run() throws {
        do {
            try ColorsPackageGenerator().generatePackage(namevariable: namevariable,
                                                         packageSuffix: packageSuffix,
                                                         assetPath: assetPath,
                                                         outputFilePath: output,
                                                         version: version,
                                                         type: type)
        } catch let error  {
            print("Generator error:\(error)")
            throw error
        }
        print("Successfuly generated \(namevariable.capitalized)Color Package at the provided path")
    }
}

extension ValidationError {
    static var invalidSourcePath = ValidationError("Could not find a valid source at the provided path")
    static var invalidOutputPath = ValidationError("Could not create or find the output file")
}
