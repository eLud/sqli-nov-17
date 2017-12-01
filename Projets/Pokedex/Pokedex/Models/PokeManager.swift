//
//  PokeManager.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 30/11/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import Foundation

class PokeManager {

    private var pokemons: [Pokemon] = []

    func add(_ p: Pokemon) {
        if !pokemons.contains(p) {
            pokemons.append(p)

            //Emmettre une notif
            let notCenter = NotificationCenter.default
            notCenter.post(name: Notification.Name("modelUpdated"), object: self, userInfo: nil)
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

}










