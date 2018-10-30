import Foundation
import Prelude

func incr(_ x: Int) -> Int {
    return x + 1
}

func square(_ x: Int) -> Int {
    return x * x
}

let f = incr >>> square

f(1)
f(2)

let f2 = incr >>> square >>> String.init

f2(2)

