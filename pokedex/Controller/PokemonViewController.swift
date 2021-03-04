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
    @IBOutlet weak var descriptionLbl: UILabel!
    
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
    
    
    @IBOutlet weak var itemContainer: UIView!
    @IBOutlet weak var evolutionsView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        setUpUIControls()
        setUpDataPokemon()
        
        super.viewWillAppear(animated)
        
        
    }
    
    
    @IBAction func evolutionBtnAction(_ sender: Any) {
        
        self.movesBtn.backgroundColor = .white
        self.movesBtn.setTitleColor(self.mainColor, for: .normal)
        self.statsBtn.backgroundColor = .white
        self.statsBtn.setTitleColor(self.mainColor, for: .normal)
        self.evolutionsBtn.backgroundColor = self.mainColor
        self.evolutionsBtn.setTitleColor(.white, for: .normal)
        
        
        itemContainer.isHidden = true
    }
    
    @IBAction func statsActionBtn(_ sender: Any) {
        self.movesBtn.backgroundColor = .white
        self.movesBtn.setTitleColor(self.mainColor, for: .normal)
        self.statsBtn.backgroundColor = self.mainColor
        self.statsBtn.setTitleColor(.white, for: .normal)
        self.evolutionsBtn.backgroundColor = .white
        self.evolutionsBtn.setTitleColor(self.mainColor, for: .normal)
        itemContainer.isHidden = false
    }
    
    @IBAction func movesActionBtn(_ sender: Any) {
        self.movesBtn.backgroundColor = self.mainColor
        self.movesBtn.setTitleColor(.white, for: .normal)
        self.statsBtn.backgroundColor = .white
        self.statsBtn.setTitleColor(self.mainColor, for: .normal)
        self.evolutionsBtn.backgroundColor = .white
        self.evolutionsBtn.setTitleColor(self.mainColor, for: .normal)
        itemContainer.isHidden = true
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

//MARK: Actions

extension PokemonViewController{
    
    
    
    
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
                
                
                self.setGradientBackground(colorTop: self.mainColor)
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
            
            if let id = pokemonData.id{
        
                NetworkingProvider.shared.getPokemonSpecies(url: "https://pokeapi.co/api/v2/pokemon-species/\(id)/") { (species: SpeciesBase) in
                    self.descriptionLbl.text = species.flavorTextEntries![7].flavorText?.capitalized
                } failure: { (error: Error?) in
                    print(error.debugDescription)
                }

                
            }
            
            
        } failure: { (error: Error?) in
            print(error.debugDescription)
        }


        
       
    }
    
}

extension PokemonViewController{


    func setGradientBackground(colorTop: UIColor) {
        
        let colorBottom = UIColor(red: 25.0/255.0, green: 5.0/255.0, blue: 5.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [1.0, 0.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}


