//
//  OficcialArtwork.swift
//  pokedex
//
//  Created by admin on 2/25/21.
//


import Foundation
struct OficcialArtwork : Decodable
{
    let frontDefault : String?

    enum CodingKeys: String, CodingKey {

        case frontDefault = "front_default"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try values.decodeIfPresent(String.self, forKey: .frontDefault)
    }

}
