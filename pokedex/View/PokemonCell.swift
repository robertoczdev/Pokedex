//
//  PokemonCell.swift
//  pokedex
//
//  Created by admin on 2/21/21.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var pokemonNumberLbl: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
