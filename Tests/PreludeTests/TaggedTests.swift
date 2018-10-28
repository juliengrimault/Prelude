import XCTest
import Foundation
@testable import Prelude

struct User: Equatable, Codable {
    typealias Id = Tagged<User, Int>

    var id: Id
    var name: String
}

struct Record: Equatable {
    typealias Id = Tagged<User, String>

    var id: Id
}

class TaggedTests: XCTestCase {
    func testIntegerLitteral() {
        let user1 = User(id: User.Id(rawValue: 1), name: "Julien")
        let user2 = User(id: 1, name: "Julien")

        XCTAssertEqual(user1, user2)
    }

    func testStringLitteral() {
        let record1 = Record(id: Record.Id(rawValue: "unique-id"))
        let record2 = Record(id: "unique-id")

        XCTAssertEqual(record1, record2)
    }

    func testDecodable() throws {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode([User].self, from: usersJSON)

        XCTAssertEqual(decoded.count, 1)
        XCTAssertEqual(decoded[0].id, 123)
        XCTAssertEqual(decoded[0].name, "Alexandra")
    }

    func testCodableRoundTrip() throws {
        let users = [User(id: 123, name: "Alexandra")]
        let coder = JSONEncoder()

        let data = try coder.encode(users)

        let decoder = JSONDecoder()
        let decoded = try decoder.decode([User].self, from: data)

        XCTAssertEqual(users, decoded)
    }
}


private let usersJSON = """
[
    {
        "id": 123,
        "name": "Alexandra"
    }
]
""".data(using: .utf8)!
