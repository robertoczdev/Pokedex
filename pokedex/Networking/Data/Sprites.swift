//
//  Sprites.swift
//  pokedex
//
//  Created by admin on 2/24/21.
//



import Foundation
struct Sprites : Decodable {
    let backDefault : String?
    let backFemale : String?
    let backShiny : String?
    let backShiny_female : String?
    let frontDefault : String?
    let frontFemale : String?
    let frontShiny : String?
    let frontShinyFemale : String?
    let other : Other?
    
    

    enum CodingKeys: String, CodingKey {

        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShiny_female = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other = "other"
            
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backDefault = try values.decodeIfPresent(String.self, forKey: .backDefault)
        backFemale = try values.decodeIfPresent(String.self, forKey: .backFemale)
        backShiny = try values.decodeIfPresent(String.self, forKey: .backShiny)
        backShiny_female = try values.decodeIfPresent(String.self, forKey: .backShiny_female)
        frontDefault = try values.decodeIfPresent(String.self, forKey: .frontDefault)
        frontFemale = try values.decodeIfPresent(String.self, forKey: .frontFemale)
        frontShiny = try values.decodeIfPresent(String.self, forKey: .frontShiny)
        frontShinyFemale = try values.decodeIfPresent(String.self, forKey: .frontShinyFemale)
        other = try values.decodeIfPresent(Other.self, forKey: .other)
               
            }

}
