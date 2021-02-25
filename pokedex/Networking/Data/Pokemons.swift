//
//  Pokemon.swift
//  pokedex
//
//  Created by admin on 2/19/21.
//

import Foundation


struct Pokemons : Decodable {
    let count:Int?
    let next:String?
    let previous:String?
    let all: [Pokemon]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case all = "results"
    }
}

