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
        }
    }

    func list() -> [Pokemon] {
        return pokemons
    }

    func remove(_ p: Pokemon) -> Pokemon? {
        guard let index = pokemons.index(of: p) else { return nil }
        return pokemons.remove(at: index)
    }

}










