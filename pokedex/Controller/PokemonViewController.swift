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
    var mainColor:UIColor = UIColor.rgb(red: 101, green: 175, blue: 229)
    
    
    
        
    
    //MARK: Outlets
    
    
    
    @IBOutlet var mainView: UIView!

    
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
    
    
    @IBOutlet weak var hpLbl: UILabel!
    @IBOutlet weak var atkLbl: UILabel!
    @IBOutlet weak var defLbl: UILabel!
    @IBOutlet weak var satkLbl: UILabel!
    @IBOutlet weak var sdefLbl: UILabel!
    @IBOutlet weak var spdLbl: UILabel!
    
    @IBOutlet weak var hpPogress: UIProgressView!
    @IBOutlet weak var atkProgress: UIProgressView!
    @IBOutlet weak var defPogress: UIProgressView!
    @IBOutlet weak var stakProgress: UIProgressView!
    @IBOutlet weak var sdefProgress: UIProgressView!
    @IBOutlet weak var spdProgress: UIProgressView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setUpUIControls()
        setUpDataPokemon()
        
        
    }
    
    

    

}

extension PokemonViewController{
    
    func setUpUIControls(){
        containerView.layer.cornerRadius = 45
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]

        typeLabel.layer.cornerRadius = 10
        typeLabel.layer.masksToBounds = true
       
   
        statsBtn.layer.cornerRadius = 20

        evolutionsBtn.layer.cornerRadius = 20
  
        movesBtn.layer.cornerRadius = 20
        
    }
    
}

extension PokemonViewController{
    //MARK: Networking
    
    func setUpDataPokemon(){
        
        self.pokemonName.text = data?.nameLabelText
        
        NetworkingProvider.shared.getPokemonData(url: self.data!.urlPokemon) { (pokemonData: PokemonBase) in
            if let types = pokemonData.types{
                self.typeLabel.text = types[0].type?.name
                
                switch types[0].type?.name {
                case "water":
                    self.mainColor = UIColor.water()
                case "grass":
                    self.mainColor = UIColor.grass()
                case "normal":
                    self.mainColor = UIColor.normal()
                case "fighting":
                    self.mainColor = UIColor.fight()
                case "poison":
                    self.mainColor = UIColor.poison()
                case "ground":
                    self.mainColor = UIColor.ground()
                case "rock":
                    self.mainColor = UIColor.rock()
                case "bug":
                    self.mainColor = UIColor.bug()
                case "ghost":
                    self.mainColor = UIColor.ghost()
                case "steel":
                    self.mainColor = UIColor.steel()
                case "fire":
                    self.mainColor = UIColor.fire()
                case "electric":
                    self.mainColor = UIColor.electric()
                case "psychic":
                    self.mainColor = UIColor.psychic()
                case "ice":
                    self.mainColor = UIColor.ice()
                case "dragon":
                    self.mainColor = UIColor.dragon()
                case "dark":
                    self.mainColor = UIColor.dark()
                case "fairy":
                    self.mainColor = UIColor.fairy()
                    
                default:
                    self.mainColor = UIColor.normal()
                }
                
                
                self.movesBtn.backgroundColor = .white
                self.movesBtn.setTitleColor(self.mainColor, for: .normal)
                self.statsBtn.backgroundColor = self.mainColor
                self.statsBtn.setTitleColor(.white, for: .normal)
                self.typeLabel.backgroundColor = self.mainColor
                self.evolutionsBtn.backgroundColor = .white
                self.evolutionsBtn.setTitleColor(self.mainColor, for: .normal)
                self.view.backgroundColor = self.mainColor
                
                
                self.hpPogress.progressTintColor = self.mainColor
                self.atkProgress.progressTintColor = self.mainColor
                self.defPogress.progressTintColor = self.mainColor
                self.stakProgress.progressTintColor = self.mainColor
                self.sdefProgress.progressTintColor = self.mainColor
                self.spdProgress.progressTintColor = self.mainColor
                
                self.hpLbl.textColor = self.mainColor
                self.atkLbl.textColor = self.mainColor
                self.defLbl.textColor = self.mainColor
                self.satkLbl.textColor = self.mainColor
                self.sdefLbl.textColor = self.mainColor
                self.spdLbl.textColor = self.mainColor
            }
            
            if let img = pokemonData.sprites?.other?.officialArtwork?.frontDefault{
                self.pokemonImage.kf.setImage(with: URL(string: img))
                
            }
            
            if let stats = pokemonData.stats{
                
                
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
