//
//  PokeManager.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 30/11/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import Foundation

class PokeManager: Codable {

    private var pokemons: [Pokemon] = []

    func add(_ p: Pokemon) {
        if !pokemons.contains(p) {
            pokemons.append(p)

            //Emmettre une notif
            let notCenter = NotificationCenter.default
            notCenter.post(name: Notification.Name("modelUpdated"), object: self, userInfo: nil)

            save()
        }
    }

    func list() -> [Pokemon] {

        return pokemons
    }

    func remove(_ p: Pokemon) -> Pokemon? {
        guard let index = pokemons.index(of: p) else { return nil }

        let removed = pokemons.remove(at: index)

        //Emmettre une notif
        let notCenter = NotificationCenter.default
        notCenter.post(name: Notification.Name("modelUpdated"), object: self, userInfo: nil)

        return removed
    }

    func save() {

        let encoder = JSONEncoder()

        //Traiter completement l'erreur
//        do {
//            let data = try encoder.encode(self)
//        } catch {
//            print(error.localizedDescription)
//        }

//        let data = try! encoder.encode(self)

        if let data = try? encoder.encode(self) {
            print(data)

            let str = String(data: data, encoding: .utf8)

            print(str!)

            parse(data: data)
        }
    }

    func parse(data: Data) {

        let decoder = JSONDecoder()
        if let manager = try? decoder.decode(PokeManager.self, from: data) {

            print(manager.list())
        }
    }

}










