import Foundation
import Files
public struct Templates {
    public enum Key: String {
        case colorKey = "ColorKey"
        case xcTest = "ColorTests"
        case color = "Color+"
        case uiColor = "UIColor+"
    }

    public static func load(_ name: Templates.Key) -> String {
        let filepath = Bundle.module.path(forResource: name.rawValue, ofType: "txt")
        guard let filepath else {
            print("ColorAutoGen: erro load Template")
            return ""
        }
            do {
                let fileString = try String(contentsOfFile: filepath)
                return fileString
            } catch {
                print("ColorAutoGen: \(error)")
            }
        return ""
    }
}
