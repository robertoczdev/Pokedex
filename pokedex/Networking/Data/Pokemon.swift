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


extension Pokemon: Displayable{
    var nameLabelText: String {
        name!
    }
    
    var urlPokemon: String {
        url!
    }
    
}

