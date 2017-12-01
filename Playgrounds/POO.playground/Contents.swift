//: Playground - noun: a place where people can play


//final = pas de surcharge possible dans les classe enfant (applicable sur class ou méthode)
//class = méthode de classe (appel sur le type et type == classe) surchargeable
//static = class + final (utilisable sur des classes, structs, …)
//override = surcharge d'une implémentation "précédente"

protocol Flying {
    func fly()
}

class Animal {

    var age = 0
    var nom = ""

    class func estimatedLifetime() {

    }
}

class Dog: Animal {

    var owner = ""

    final func run() {

    }

    private func qqChose() {

    }

    //static = class + final (pas de surcharge possible dans les classe enfant
    override static func estimatedLifetime() {
        print("Dog lifetime")
    }

    func happyBirthday() {
        age += 1
    }
}

class Bird: Animal, Flying {

    var flyingTime = 20

    func fly() {

    }

    override class func estimatedLifetime() {
        print("Bird lifetime")
    }
}

struct Cat {

    //Propriété avec observateurs
    var age = 0 {
        willSet {
            print("WillSet. Now : \(age), will set : \(newValue)")
        }

        didSet {
            print("DidSet. Now : \(age), was : \(oldValue)")
            if age < 0 {
                age = 0
            }
        }
    }

    private(set) var color = "Red"

    //Computed property (complexité O(1))
    var humanAge: Int {
        get {
            let hAge = age * 7
            return hAge
        }

        //newValue ou nom défini
        set (newAge) {
            age = newAge / 7
        }
    }

    mutating func happyBirthday() {
        age += 1
    }

    static func estimatedLifetime() {
        print("Bird lifetime")
    }
}
Cat.estimatedLifetime()

let medor = Dog() // Class
//medor = Dog()
let medor2 = medor

medor.age = 1
medor.age

medor2.age

Dog.estimatedLifetime()

var félix = Cat() // Struct
let félix2 = félix

félix.age = 1
félix.age
félix2.age

//félix.color = "Blue"
//cannot assign to property: 'color' setter is inaccessible

félix.humanAge = 14

enum TransportStatus {
    case onTime
    case delayed (delay: Int, reason: String)
    case cancelled
    case unknown
}

var status = TransportStatus.onTime
status = .delayed(delay: 5, reason: "Fog")

struct Flight {
    var flightNumber: String
    var status: TransportStatus
}

var af84 = Flight(flightNumber: "AF84", status: .onTime)
af84.status = .delayed(delay: 4, reason: "Dodo")


switch af84.status {

case .delayed (let associated) where associated.delay < 5:
    fallthrough
case .onTime:
    print("Plane onTime")
case .delayed (let associated):
    print("Plane delayed by \(associated.delay) minutes because of \(associated.reason)")
case .cancelled:
    ()
case .unknown:
    ()
}

enum TransportType: Int {
    case plane
    case car
    case train

    func emojiValue() -> String {
        switch self {
        case .plane:
            return "✈️"
        case .car:
            return "🚗"
        case .train:
            return "🚆"
        }
    }

    init?(emoji: String) {
        switch emoji {
        case "✈️", "🛫", "🛩", "plane":
            self = .plane
        case "🚗":
            self = .car
        case "🚆":
            self = .train
        default:
        return nil
        }
    }
}

let transport = TransportType.car
transport.emojiValue()

let t2 = TransportType(emoji: "🚢")


protocol Bestiole {

    var name: String { get set }
    func mange()
}

extension Bestiole {

    func mange() {
        print("Je mange")
    }

    func youhou() {
        mange()
        print("Youhou")
    }
}

struct Pokemon: Bestiole {

    var name: String

    func attaque() {

    }
}

class Caniche: Bestiole {

    var name: String = ""

    func donneLaPate() {

    }
}

struct Pigeon: Bestiole, Flying {

    var name: String

    func mange() {
        print("Je picorre")
    }

    func fly() {

    }
}

let tabBestiole: [Bestiole] = []

for b in tabBestiole {


    if let c = b as? Caniche {
        c.donneLaPate()
    } else if let c = b as? Pokemon {
        c.attaque()
    }
}
func promener(_ b: Bestiole) {
    print("Je promene \(b.name)")
}




















