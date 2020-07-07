
struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(citizens: [String], name: String, resources: [String:Int]) {
        self.citizens = citizens
        self.name = name.uppercased()
        self.resources = resources
    }
    
    mutating func harvestRice() {
        resources["Rice"] = 100
    }
}

var myTown = Town(citizens: ["Angela", "Jack Bauer"], name: "Angelaland", resources: ["Wool" : 75])

myTown.citizens.append("Keanu Reeves")

print("People of \(myTown.name): \(myTown.citizens)")

myTown.harvestRice()
print(myTown.resources)
