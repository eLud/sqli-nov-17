//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ludovic Ollagnier on 30/11/2017.
//  Copyright © 2017 SQLI. All rights reserved.
//

import Foundation

struct Pokemon: Codable {

    init(name: String, level: Int, type: PokemonType, captured: Bool, captureDate: Date? = nil, pictureURL: URL? = nil) {

        self.name = name
        self.level = level
        self.type = type
        self.isCaptured = captured

        if captured {
            self.captureDate = captureDate ?? Date()
        }

        self.pictureURL = pictureURL
    }

    enum PokemonType: Int, Codable {
        case water
        case fire
        case ice
        case other

        var emojiValue: String {
            switch self {
            case .water:
                return "💦"
            case .fire:
                return "🔥"
            case .ice:
                return "❄️"
            case .other:
                return "⚠️"
            }
        }

        static var allTypes: [PokemonType] {
            return [.water, .fire, .ice, .other ]
        }
    }

    var name: String
    let type: PokemonType
    var level: Int
    var isCaptured: Bool {
        didSet {
            if isCaptured {
                captureDate = Date()
            } else {
                captureDate = nil
            }
        }
    }
    private(set) var captureDate: Date?
    var pictureURL: URL?
}

extension Pokemon: Equatable  {
    static func ==(lhs: Pokemon, rhs: Pokemon) -> Bool {
        if lhs.name == rhs.name && lhs.level == rhs.level && lhs.type == rhs.type {
            return true
        }

        return false
    }
}

extension Pokemon: CustomStringConvertible {
    var description: String {
        return "Je suis un Pokemon qui s'appelle \(name)"
    }
}














