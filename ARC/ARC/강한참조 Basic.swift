
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "yagom")
reference2 = reference1
reference3 = reference1


reference1 = nil
reference2 = nil
reference3 = nil

var globalReference: Person?

// 함수 내부에서 정의된 강한 참조 지역변수는 함수가 종료될 때 Reference Count가 1 감소한다.
// 밑의 함수처럼 전역 변수로 선언이 되면서 RC가 2로 증가하였고, 함수가 종료될 때에는 1만 감소하기 때문에 메모리에서 해제되지 않는다.
func foo() {
    let yagom: Person = Person(name: "pangeun")
    
    globalReference = yagom
}

foo()
