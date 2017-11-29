//: Playground - noun: a place where people can play

import Foundation

//1er principe : Typage fort
//2nd : Importance des constantes
//3eme : Type inference

let languageName = "Swift"
var version: Float = 4.0
let isAwesome = true
let introductionYear = 2014

var test: Double = 65.65

var a: Int = 5
var b: Int = 2

var c = Double(a) / Double(b)

//: #Collections

//: Collections typées

//: ##Tableaux

var tab: [String] = ["Paris", "Lyon"]
let tab2: Array<String> = ["Lyon", "Paris"]

if tab == tab2 {
    print("Oui")
} else {
    print("Non")
}

tab.append("Marseille")
tab.append("Lille")

tab.remove(at: 1)

//tab.removeAll()
let first = tab.last

tab[0] = "Bordeaux"

tab
tab[0...1] = ["Paris", "Lyon"]
tab

//: ##Dictionnaires

let dico: [String:String] = ["firstName": "Ludovic", "lastName":"Ollagnier"]
var dico2: Dictionary<String, Int> = ["Paris":754653, "Lyon":63633]

dico2["Marseille"] = 45
dico2["Marseille"] = 42

let keys = Array(dico2.values)

//dico2["Marseille"] = nil
dico2.removeValue(forKey: "Marseille")

dico2


//: ##Ensemble

var cities: Set = ["Paris", "Nantes"]
var cities2 = Set<String>()
var cities3: Set<String> = []

let retour = cities2.insert("Lyon")


cities2.insert("Lyon")
cities2

//: #Boucles

//for (var i = 0; i<=10; i+=1) {
//
//}

// For <=
for i in 0...100 {
    
}

// For <
for i in 0..<10 {

}

tab[1...]

for truc in tab[...2] {

}

for c in "Héllo World" {
    print(c)
}

tab

var tab3 = [10,20,30]

for valeur in dico2 {
//    tab3.insert(0, at: 1)
    print(valeur)
}

print(tab3)

//: #Conditions

//: ##If

if tab3.count > 0 {

} else if tab3.count < 3 {

} else {

}

tab3.count < 3 ? () : ()

//: ##Switch

switch tab3.count {
case 0:
    ()
case 1:
    ()
case 2:
    ()
default:
    break
}

//: ##Guard

//tab3.removeAll()

guard tab3.count > 0 else { fatalError("Probleme") }

print(tab3[0])

//: #Fonctions

func myFunc() {

}

func manger(_ 🍛: String) {

    print("Je mange du " + 🍛)
}

func manger(_ aliment: String = "Poulet" , ami: String = "") {

    print("Je mange du \(aliment) avec \(ami)")
}

myFunc()
manger("Pizza")
manger("Pomme", ami: "Robert")
manger("",ami: "")

manger("b")


func returnSomething() -> Int {

    return 5
}

let monInt = returnSomething()

func request(url: String) -> (code: Int, message: String) {

    return (200, "OK")
}

let reponse = request(url: "")
reponse.message


func variadic(elements: String...) {
    for str in elements {
        print(str)
    }
}

variadic(elements: "Hello", "World")

print("Hello", "World", separator: ",", terminator: ":P")


//: #Optionals

let capitales = ["France" : "Paris", "USA" : "Washington", "Canada" : "Ottawa"]

if let paris = capitales["France"], paris.count > 4{
    print("J'habite à " + paris)
}

let intro = "J'habite à "

if let popString = capitales["USA"], let popInt = Int(popString) {

}

guard let capUSA = capitales["USA"] else { fatalError() }

guard capitales["USA"] != nil else { fatalError() }


let defaultValue = capitales["USA"] ?? "Je sais pas"



import UIKit

let tf = UITextField()

if let texteCount = tf.text?.count {

}


struct Dog {

    var age = 0
    private let nom = "Médor"

    func run() {

    }

    private func qqChose() {

    }

    static func aStaticFunc() {

    }
}


let medor = Dog()
let brutus = Dog()

medor == brutus


















