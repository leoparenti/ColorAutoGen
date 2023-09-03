import Foundation
import Files

public struct ColorsPackageGenerator: Generator {
    typealias ColorName = String

    func generatePackage(namevariable: String,
                         packageSuffix: String,
                         assetPath: String,
                         outputFilePath: String,
                         version: String,
                         type: String) throws { 
        let package = PackageInfo(path: outputFilePath,
                                  variable: namevariable,
                                  suffix: packageSuffix,
                                  version: version,
                                  type: type)
        do {
                try createFolder(package: package)
                Terminal.packageCreate(path: package.folderPath)
                try copy(package: package, from: assetPath)

                let colors = try! getColors(from: assetPath)
                try createColorKey(package: package, colors: colors)
                try createColorClass(package: package, colors: colors)
                try createUIColorClass(package: package, colors: colors)
                try createXCTest(package: package, colors: colors)

                Terminal.swiftLint(path: package.folderPath)
                Terminal.runXcode(path: package.folderPath)
        } catch {
                print("ColorAutoGen[error]: \(error)" )
                throw error
            }
    }

    func createFolder(package: PackageInfo) throws {
        try FileManager.default.createDirectory(atPath: package.folderPath, withIntermediateDirectories: true, attributes: nil)
        print("ColorAutoGen: folder \(package.folderPath) created")
        }

    func copy(package: PackageInfo, from xcassetPath: String) throws {
        try FileManager.default.copyItem(atPath: xcassetPath, toPath: package.assetPath)
        print("ColorAutoGen: xcassets imported")
        }

//    func getColors(from path: String) throws -> [ColorName] {
//        let colorSetSuffix = ".colorset"
//        let colors = try! FileManager.default.contentsOfDirectory(at: URL(string: path)!,
//                                                                  includingPropertiesForKeys: [.nameKey, .isDirectoryKey], options: .skipsHiddenFiles)
//            .filter{ $0.hasSuffix(colorSetSuffix) }
//            .map { URL(string:$0)!.lastPathComponent }
//            .map { $0.replacingOccurrences(of: colorSetSuffix, with: "") }
//        return colors
//    }

    private func getColors(from path: String) throws -> [ColorString] {
        let colorSetSuffix = ".colorset"
        let assetsFolder = try Folder(path: path)
        let colorFolders = assetsFolder.subfolders.filter { (folder) -> Bool in
            folder.name.hasSuffix(colorSetSuffix)
        }
        let colors = colorFolders.map { (folder) -> ColorString in
            ColorString(folder.name.replacingOccurrences(of: colorSetSuffix, with: ""))
        }
        return colors
    }
}

extension String {
    @discardableResult
    public func createFile(at path: String) throws -> Bool {
        let url = URL(fileURLWithPath: path)
        do {
            try self.write(to: url, atomically: true, encoding: .utf8)
        } catch {
                print("Error writing \(path) \n\(error)" )
                return false
            }
        return true
    }
}
