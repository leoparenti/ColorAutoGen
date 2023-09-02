import Foundation
import Files

extension ColorsPackageGenerator {

    func createColorKey(package: ColorPackage, colors: [ColorString]) throws {
        let data = colors.map{ $0.rowCase }.joined(separator: "\n")
        let fileContent = Templates.load(.colorKey).assign(data: data)
        try fileContent.createFile(at: package.colorKeyFile)
        print("ColorAutoGen: created colors key")
    }

    func createColorClass(package: ColorPackage, colors: [ColorString]) throws {
        let data = colors.map{ $0.rowColorClass }.joined(separator: "\n")
        let usage = usageColor.replacingOccurrences(of: "{first_color}", with: colors.randomElement()?.name ?? "")
        let all = (rowClassIndent + rowCaseIndent) + colors.map{ $0.name }.joined(separator: ", ")
        let fileContent = Templates.load(.color).assign(data: data,
                                                        name: package.name,
                                                        variable: package.variable,
                                                        usage: usage,
                                                        all: all)
        try fileContent.createFile(at: package.colorClassPath)
        print("ColorAutoGen: created Colors Class")
    }

    func createUIColorClass(package: ColorPackage, colors: [ColorString]) throws {
        let data = colors.map{ $0.rowUIColorClass }.joined(separator: "\n")
        let usage = usageUIColor.replacingOccurrences(of: "{first_color}", with: colors.randomElement()?.name ?? "")
        let all = (rowClassIndent + rowCaseIndent) + colors.map{ $0.name }.joined(separator: ", ")
        let fileContent = Templates.load(.uiColor).assign(data: data,
                                                          name: package.name,
                                                          variable: package.variable,
                                                          usage: usage,
                                                          all: all)
        try fileContent.createFile(at: package.uiColorPath)
        print("ColorAutoGen: created UIColors Class")
    }

    func createXCTest(package: ColorPackage, colors: [ColorString]) throws {
        let data = colors.map{ $0.rowXCTest }.joined(separator: "\n")
        let fileContent = Templates.load(.xcTest).assign(data: data,
                                                         name: package.name,
                                                         variable: package.variable)
        try fileContent.createFile(at: package.xcTestPath)
        print("ColorAutoGen: created XCTests")
    }
}

let rowClassIndent = "        "
let rowCaseIndent = "    "
let usageColor = "// Usage: Color.{variable}.{first_color}"
let usageUIColor = "// Usage: UIColor.{variable}.{first_color}"

extension ColorString {
    var rowCase: String {
        "\(rowCaseIndent)case \(name) = \"\(key)\""
    }

    var rowColorClass: String {
        "\(rowClassIndent)public static let \(name) = Color.create(.\(name))"
    }

    var rowUIColorClass: String {
        "\(rowClassIndent)public static let \(name) = UIColor.create(.\(name)).notNilOrClear"
    }

    var rowXCTest: String {
        "\(rowClassIndent)XCTAssertNotEqual(UIColor.{variable}.\(name), UIColor.clear)"
    }
}

extension String {
    func assign(data: String,
                name: String = "",
                variable: String = "",
                usage: String = "",
                all: String = "") -> String{
        let header = "// generated with ColorAutogen"
        return self.replacingOccurrences(of: "{header}", with: header)
            .replacingOccurrences(of: "{usage}", with: usage)
            .replacingOccurrences(of: "{data}", with: data)
            .replacingOccurrences(of: "{name}", with: name)
            .replacingOccurrences(of: "{variable}", with: variable)
            .replacingOccurrences(of: "{all}", with: all)
    }
}
