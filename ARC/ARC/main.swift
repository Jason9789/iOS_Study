//
//  main.swift
//  ARC
//
//  Created by 전판근 on 2021/03/31.
//

import Foundation

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: Room?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

// 약한 상수는 상수에서 쓰일 수 없다.
class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    weak var host: Person?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom")
var room: Room? = Room(number: "505")

room?.host = yagom
yagom?.room = room

yagom = nil
print(room?.host)

room = nil
print(yagom?.room)


