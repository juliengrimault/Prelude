import Foundation

/// This is used to create strongly typed values for scalar type
/// The main use case is for something as follow:
/// ```
/// struct User {
///   typealias Id = Tagged<User, Int>
///   var id: Id
/// }
/// ```
/// the identifier of a User object is an Int under the hood but havving it defined `Tagged<User, Int>` buys us some type safety
/// see: https://www.pointfree.co/episodes/ep12-tagged

public struct Tagged<Type, Value>: RawRepresentable {
    public var rawValue: Value

    public init(rawValue: Value) {
        self.rawValue = rawValue
    }
}

extension Tagged: Equatable where Value: Equatable {
}

/// Mark: Codable

extension Tagged: Encodable where Value: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

extension Tagged: Decodable where Value: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Value.self)
    }
}

/// Convenience

extension Tagged: ExpressibleByIntegerLiteral where Value: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Value.IntegerLiteralType

    public init(integerLiteral value: IntegerLiteralType) {
        rawValue = Value(integerLiteral: value)
    }
}

extension Tagged: ExpressibleByUnicodeScalarLiteral where Value: ExpressibleByUnicodeScalarLiteral {
    public typealias UnicodeScalarLiteralType = Value.UnicodeScalarLiteralType

    public init(unicodeScalarLiteral value: Value.UnicodeScalarLiteralType) {
        rawValue = Value(unicodeScalarLiteral: value)
    }
}

extension Tagged: ExpressibleByExtendedGraphemeClusterLiteral where Value: ExpressibleByExtendedGraphemeClusterLiteral {
    public typealias ExtendedGraphemeClusterLiteralType = Value.ExtendedGraphemeClusterLiteralType

    public init(extendedGraphemeClusterLiteral value: Value.ExtendedGraphemeClusterLiteralType) {
        rawValue = Value(extendedGraphemeClusterLiteral: value)
    }
}

extension Tagged: ExpressibleByStringLiteral where Value: ExpressibleByStringLiteral {
    public typealias StringLiteralType = Value.StringLiteralType

    public init(stringLiteral value: Value.StringLiteralType) {
        rawValue = Value(stringLiteral: value)
    }

}
