

import Foundation
struct EvolutionDetails : Codable {
	let gender : String?
	let held_item : String?
	let item : String?
	let known_move : String?
	let known_move_type : String?
	let location : String?
	let min_affection : String?
	let min_beauty : String?
	let min_happiness : String?
	let min_level : Int?
	let needs_overworld_rain : Bool?
	let party_species : String?
	let party_type : String?
	let relative_physical_stats : String?
	let time_of_day : String?
	let trade_species : String?
	let trigger : Trigger?
	let turn_upside_down : Bool?

	enum CodingKeys: String, CodingKey {

		case gender = "gender"
		case held_item = "held_item"
		case item = "item"
		case known_move = "known_move"
		case known_move_type = "known_move_type"
		case location = "location"
		case min_affection = "min_affection"
		case min_beauty = "min_beauty"
		case min_happiness = "min_happiness"
		case min_level = "min_level"
		case needs_overworld_rain = "needs_overworld_rain"
		case party_species = "party_species"
		case party_type = "party_type"
		case relative_physical_stats = "relative_physical_stats"
		case time_of_day = "time_of_day"
		case trade_species = "trade_species"
		case trigger = "trigger"
		case turn_upside_down = "turn_upside_down"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		held_item = try values.decodeIfPresent(String.self, forKey: .held_item)
		item = try values.decodeIfPresent(String.self, forKey: .item)
		known_move = try values.decodeIfPresent(String.self, forKey: .known_move)
		known_move_type = try values.decodeIfPresent(String.self, forKey: .known_move_type)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		min_affection = try values.decodeIfPresent(String.self, forKey: .min_affection)
		min_beauty = try values.decodeIfPresent(String.self, forKey: .min_beauty)
		min_happiness = try values.decodeIfPresent(String.self, forKey: .min_happiness)
		min_level = try values.decodeIfPresent(Int.self, forKey: .min_level)
		needs_overworld_rain = try values.decodeIfPresent(Bool.self, forKey: .needs_overworld_rain)
		party_species = try values.decodeIfPresent(String.self, forKey: .party_species)
		party_type = try values.decodeIfPresent(String.self, forKey: .party_type)
		relative_physical_stats = try values.decodeIfPresent(String.self, forKey: .relative_physical_stats)
		time_of_day = try values.decodeIfPresent(String.self, forKey: .time_of_day)
		trade_species = try values.decodeIfPresent(String.self, forKey: .trade_species)
		trigger = try values.decodeIfPresent(Trigger.self, forKey: .trigger)
		turn_upside_down = try values.decodeIfPresent(Bool.self, forKey: .turn_upside_down)
	}

}
