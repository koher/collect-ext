import XCTest
import CollectExt

final class RandomAccessCollectionTests: XCTestCase {
    func testDropLastWhile() {
        XCTAssertEqual([2, 3, 5, 7, 11].dropLast(while: { $0 > 11}), [2, 3, 5, 7, 11])
        XCTAssertEqual([2, 3, 5, 7, 11].dropLast(while: { $0 > 7}), [2, 3, 5, 7])
        XCTAssertEqual([2, 3, 5, 7, 11].dropLast(while: { $0 > 5}), [2, 3, 5])
        XCTAssertEqual([2, 3, 5, 7, 11].dropLast(while: { $0 > 3}), [2, 3])
        XCTAssertEqual([2, 3, 5, 7, 11].dropLast(while: { $0 > 2}), [2])
        XCTAssertEqual([2, 3, 5, 7, 11].dropLast(while: { $0 > 1}), [])
    }
    
    func testSuffixWhile() {
        XCTAssertEqual([2, 3, 5, 7, 11].suffix(while: { $0 > 11}), [])
        XCTAssertEqual([2, 3, 5, 7, 11].suffix(while: { $0 > 7}), [11])
        XCTAssertEqual([2, 3, 5, 7, 11].suffix(while: { $0 > 5}), [7, 11])
        XCTAssertEqual([2, 3, 5, 7, 11].suffix(while: { $0 > 3}), [5, 7, 11])
        XCTAssertEqual([2, 3, 5, 7, 11].suffix(while: { $0 > 2}), [3, 5, 7, 11])
        XCTAssertEqual([2, 3, 5, 7, 11].suffix(while: { $0 > 1}), [2, 3, 5, 7, 11])
    }
}
