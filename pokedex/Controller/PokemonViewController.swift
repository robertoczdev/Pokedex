//
//  PokemonViewController.swift
//  pokedex
//
//  Created by admin on 2/21/21.
//

import UIKit
import Kingfisher

class PokemonViewController: UIViewController {
    
    //MARK: Variables
    var data:Displayable?
    
    
    
        
    
    //MARK: Outlets
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var evolutionsBtn: UIButton!
    @IBOutlet weak var statsBtn: UIButton!
    @IBOutlet weak var movesBtn: UIButton!
    
    @IBOutlet weak var hpValueLbl: UILabel!
    @IBOutlet weak var atkValueLbl: UILabel!
    @IBOutlet weak var defValueLbl: UILabel!
    @IBOutlet weak var satkValueLbl: UILabel!
    @IBOutlet weak var sdefValueLbl: UILabel!
    @IBOutlet weak var spdValueLbl: UILabel!
    
    @IBOutlet weak var hpPogress: UIProgressView!
    @IBOutlet weak var atkProgress: UIProgressView!
    @IBOutlet weak var defPogress: UIProgressView!
    @IBOutlet weak var stakProgress: UIProgressView!
    @IBOutlet weak var sdefProgress: UIProgressView!
    @IBOutlet weak var spdProgress: UIProgressView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpViewController()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpData()
        setUpDataPokemon()
        
    }
    
    

    

}

extension PokemonViewController{
    
    func setUpViewController(){
        containerView.layer.cornerRadius = 45
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        
        
        typeLabel.layer.cornerRadius = 10
        typeLabel.layer.masksToBounds = true
        
        statsBtn.layer.cornerRadius = 20
        statsBtn.backgroundColor = UIColor.rgb(red: 101, green: 175, blue: 229)
        
        evolutionsBtn.backgroundColor = .white
        evolutionsBtn.setTitleColor(UIColor.rgb(red: 101, green: 175, blue: 229), for: .normal)
        evolutionsBtn.layer.cornerRadius = 20
        
        movesBtn.backgroundColor = .white
        movesBtn.setTitleColor(UIColor.rgb(red: 101, green: 175, blue: 229), for: .normal)
        movesBtn.layer.cornerRadius = 20
        
        
    }
    
    
    func setUpData()  {
        self.pokemonName.text = data?.nameLabelText
        print(data?.urlPokemon)
    }
    
}

extension PokemonViewController{
    //MARK: Networking
    
    func setUpDataPokemon(){
        
        
        NetworkingProvider.shared.getPokemonTypes(url: self.data!.urlPokemon) { (poke: PokemonBase) in
            if let types = poke.types{
                self.typeLabel.text = types[0].type?.name
                for type in types{
                    print(type.type?.name)
                }
            }
            
            if let img = poke.sprites?.other?.officialArtwork?.frontDefault{
                self.pokemonImage.kf.setImage(with: URL(string: img))
                
            }
            
            if let stats = poke.stats{
                
                
                self.hpValueLbl.text = String(format: "%03d", (stats[0].baseStat!))
                self.atkValueLbl.text = String(format: "%03d", (stats[1].baseStat!))
                self.defValueLbl.text = String(format: "%03d", (stats[2].baseStat!))
                self.satkValueLbl.text = String(format: "%03d", (stats[3].baseStat!))
                self.sdefValueLbl.text = String(format: "%03d", (stats[4].baseStat!))
                self.spdValueLbl.text = String(format: "%03d", (stats[5].baseStat!))
                
                //120 is the highest stat value
                self.hpPogress.progress = (Float(stats[0].baseStat!)/120)
                self.atkProgress.progress = (Float(stats[1].baseStat!)/120)
                self.defPogress.progress = (Float(stats[2].baseStat!)/120)
                self.stakProgress.progress = (Float(stats[3].baseStat!)/120)
                self.sdefProgress.progress = (Float(stats[4].baseStat!)/120)
                self.spdProgress.progress = (Float(stats[5].baseStat!)/120)
                
               
            }
            
            
        } failure: { (error: Error?) in
            print(error.debugDescription)
        }


        
       
    }
    
}
