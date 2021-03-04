

import Foundation
struct FlavorTextEntries : Decodable {
    let flavorText : String?
    let language : Language?
    let version : Version?

    enum CodingKeys: String, CodingKey {

        case flavorText = "flavor_text"
        case language = "language"
        case version = "version"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flavorText = try values.decodeIfPresent(String.self, forKey: .flavorText)
        language = try values.decodeIfPresent(Language.self, forKey: .language)
        version = try values.decodeIfPresent(Version.self, forKey: .version)
    }

}
