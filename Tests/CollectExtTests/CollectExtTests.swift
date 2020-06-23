import XCTest
import Foundation
import CollectExt

final class CollectExtTests: XCTestCase {
    func testExample() {
        let history = [
            HistoryItem(date: Date(timeIntervalSinceReferenceDate: 0), value: 0),
            HistoryItem(date: Date(timeIntervalSinceReferenceDate: 1), value: 1),
            HistoryItem(date: Date(timeIntervalSinceReferenceDate: 2), value: 2),
            HistoryItem(date: Date(timeIntervalSinceReferenceDate: 3), value: 3),
            HistoryItem(date: Date(timeIntervalSinceReferenceDate: 4), value: 4),
        ]

        let range: Range<Date> = // ...
            Date(timeIntervalSinceReferenceDate: 1) ..< Date(timeIntervalSinceReferenceDate: 3)
        let items = history
            .dropLast(while: { $0.date >= range.upperBound })
            .suffix(while: { $0.date >= range.lowerBound })

        do {
            var items = items
            XCTAssertEqual(items.count, 2)
            XCTAssertEqual(items.popFirst()?.value, .some(1))
            XCTAssertEqual(items.popFirst()?.value, .some(2))
            XCTAssertNil(items.popFirst())
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

struct HistoryItem {
    var date: Date
    var value: Int
}
