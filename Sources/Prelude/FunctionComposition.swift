import Foundation

precedencegroup FunctionCompositionGroup {
    associativity: left
}

infix operator >>>: FunctionCompositionGroup

public func >>><A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { x in
        g(f(x))
    }
}
