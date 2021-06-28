//
//  Pokemon.swift
//  pokedex
//
//  Created by admin on 2/21/21.
//

import Foundation

struct Pokemon: Decodable {
    let name: String?
    let url: String?
}

extension Pokemon: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
      lhs.name == rhs.name
    }
}

extension Pokemon: Displayable{
    var nameLabelText: String {
        name!
    }
    
    var urlPokemon: String {
        url!
    }
    
}

