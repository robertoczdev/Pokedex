

import Foundation
struct SpeciesBase : Decodable {

    let flavorTextEntries : [FlavorTextEntries]?
    

    enum CodingKeys: String, CodingKey {


        case flavorTextEntries = "flavor_text_entries"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       
        flavorTextEntries = try values.decodeIfPresent([FlavorTextEntries].self, forKey: .flavorTextEntries)
        
    }

}
