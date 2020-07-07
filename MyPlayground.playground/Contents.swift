

func greeting() {
    print("Hello")
}

greeting()

func greeting2(name: String) {
    print("\(name) Hello")
}

greeting2(name: "Jason")

func greeting3(name: String) -> Bool {
    if name == "Angela" || name == "Jason" {
        return true
    } else {
        return false
    }
}

var doorShouldOpen = greeting3(name: "Angela")
print(doorShouldOpen)

