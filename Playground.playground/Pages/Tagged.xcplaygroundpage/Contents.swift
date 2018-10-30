import Foundation
import Prelude

struct User {
    typealias Id = Tagged<User, Int>
    var id: Id
}

struct Subscription {
    typealias Id = Tagged<Subscription, Int>
    var id: Id
    var userId: User.Id
}

// here we now are sure to mistakenly using a userId for a subscription Id or vice versa

let u1 = User(id: 1)
let s1 = Subscription(id: 1, userId: u1.id)

// can't do this
// let u2 = User(id: s1.id)

