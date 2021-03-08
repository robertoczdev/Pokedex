import Foundation
struct EvolutionBase : Decodable {
	let babyTriggerItem : String?
	let chain : Chain?
	let id : Int?

	enum CodingKeys: String, CodingKey {

		case babyTriggerItem = "baby_trigger_item"
		case chain = "chain"
		case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		babyTriggerItem = try values.decodeIfPresent(String.self, forKey: .babyTriggerItem)
		chain = try values.decodeIfPresent(Chain.self, forKey: .chain)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
	}

}
