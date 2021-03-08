import Foundation
struct Chain : Decodable {
	let evolutionDetails : [String]?
	let evolvesTo : [EvolvesTo]?
	let isBaby : Bool?
	let species : Species?

	enum CodingKeys: String, CodingKey {

		case evolutionDetails = "evolution_details"
		case evolvesTo = "evolves_to"
		case isBaby = "is_baby"
		case species = "species"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		evolutionDetails = try values.decodeIfPresent([String].self, forKey: .evolutionDetails)
		evolvesTo = try values.decodeIfPresent([EvolvesTo].self, forKey: .evolvesTo)
		isBaby = try values.decodeIfPresent(Bool.self, forKey: .isBaby)
		species = try values.decodeIfPresent(Species.self, forKey: .species)
	}

}
