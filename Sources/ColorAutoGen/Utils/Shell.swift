import Foundation
struct Terminal {
    static func packageCreate(path: String){
        let comand = "cd \(path) && swift package init"
        let package = URL(string:path)?.lastPathComponent ?? ""
        print("ColorAutoGen: creating package \(package.capitalized)...")
        print(shellEnv(comand))
    }

    static func runXcode(path: String){
        let comand = "xed \(path)"
        print("ColorAutoGen: open xcode...")
        print(shellEnv(comand))
    }

    static func swiftLint(path: String){
        let comand = "cd \(path) && swiftlint --autocorrect"
        let package = URL(string:path)?.lastPathComponent ?? ""
        print("ColorAutoGen: swiftlint \(package.capitalized)...")
        print(shellEnv(comand))
    }

    @discardableResult
    static func shellEnv(_ command: String) -> String {
        let task = Process()
        let pipe = Pipe()

        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-cl", command]
        task.launchPath = "/bin/zsh"
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!

        return output
    }
}
