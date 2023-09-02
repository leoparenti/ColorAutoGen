import class Foundation.Bundle

extension Foundation.Bundle {
    static let module: Bundle = {
        let mainPath = Bundle.main.bundleURL.appendingPathComponent("ColorAutoGen_ColorAutoGen.bundle").path
        let buildPath = "/Users/leyo/workspace/ColorAutoGen/.build/arm64-apple-macosx/release/ColorAutoGen_ColorAutoGen.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}