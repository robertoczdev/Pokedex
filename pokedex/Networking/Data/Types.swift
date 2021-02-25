//
//  Types.swift
//  pokedex
//
//  Created by admin on 2/24/21.
//
import Foundation
struct Types : Decodable {
    let slot : Int?
    let type : Type?

    enum CodingKeys: String, CodingKey {

        case slot = "slot"
        case type = "type"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        slot = try values.decodeIfPresent(Int.self, forKey: .slot)
        type = try values.decodeIfPresent(Type.self, forKey: .type)
    }

}
