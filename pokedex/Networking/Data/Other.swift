//
//  Other.swift
//  pokedex
//
//  Created by admin on 2/25/21.
//


import Foundation
struct Other : Decodable {
    
    let officialArtwork : OficcialArtwork?

    enum CodingKeys: String, CodingKey {

        
        case officialArtwork = "official-artwork"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        officialArtwork = try values.decodeIfPresent(OficcialArtwork.self, forKey: .officialArtwork)
    }

}
