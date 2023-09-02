// generated with ColorAutogen
@testable import LibraryColor
import XCTest
import SwiftUI

final class LibraryColorTests: XCTestCase {

    func testAllColors() throws {
        XCTAssertNotEqual(UIColor.library.backgroundCard, UIColor.clear)
        XCTAssertNotEqual(UIColor.library.dark, UIColor.clear)
        XCTAssertNotEqual(UIColor.library.green, UIColor.clear)
        XCTAssertNotEqual(UIColor.library.redFerrari, UIColor.clear)
        XCTAssertNotEqual(UIColor.library.white, UIColor.clear)
    }

    func test_create() throws {
        for key in ColorKey.allCases {
            XCTAssertNotNil(UIColor.create(key))
        }
    }
}
