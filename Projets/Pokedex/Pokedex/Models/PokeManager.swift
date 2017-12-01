//
//  PokeManager.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 30/11/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import Foundation

class PokeManager: Codable {

    private var pokemons: [Pokemon]

    private init() {
        pokemons = []
    }

    static func manager() -> PokeManager {

        var documentUrl = documentDirectoryURL()
        documentUrl.appendPathComponent("pokemon.json")
        if let data = try? Data(contentsOf: documentUrl),
            let manager = parse(data: data) {
            return manager
        }
        return PokeManager()
    }

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

        save()
        
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

            var documentUrl = PokeManager.documentDirectoryURL()
            documentUrl.appendPathComponent("pokemon.json")

            print(documentUrl)

            try? data.write(to: documentUrl)
        }
    }

    static func parse(data: Data) -> PokeManager? {

        let decoder = JSONDecoder()
        if let manager = try? decoder.decode(PokeManager.self, from: data) {
            return manager
        }

        return nil
    }

    static func documentDirectoryURL() -> URL {

        let fm = FileManager.default
        let url = fm.urls(for: .documentDirectory, in: .userDomainMask)
        guard let first = url.first else { fatalError() }

        return first
    }

}










