
// 설계도. blueprint
struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        // swift에서는 this가 아니라 self
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    func fortify() {
        print("Defences increased!")
    }
}

var anotherTown = Town(name: "Nameless Island", citizens: ["Tom Hanks"], resources: ["Coconuts": 100])

anotherTown.citizens.append("Wilson")

print(anotherTown.name)
print(anotherTown.citizens)

var ghostTown = Town(name: "Ghosty McGhostface", citizens: [], resources: ["Tumbleweed": 1])

anotherTown.citizens.append("Wilson")
ghostTown.fortify()
