//
//  PokemonViewController.swift
//  pokedex
//
//  Created by admin on 2/21/21.
//

import UIKit
import Kingfisher

class PokemonViewController: BottomPopupViewController {
    
    //MARK: Variables
    var data:Displayable?
    var idPokemon:Int?
    var mainColor:UIColor = UIColor.rgb(red: 101, green: 175, blue: 229)
    var pokemonSprites : Sprites?
    
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    var text: String?
    var index:Int = 5
    
    //MARK: Properties
    
    // Bottom popup attribute variables
    // You can override the desired variable to change appearance
    
    override var popupHeight: CGFloat { return height ?? CGFloat(300) }
    
    override var popupTopCornerRadius: CGFloat { return topCornerRadius ?? CGFloat(10) }
    
    override var popupPresentDuration: Double { return presentDuration ?? 1.0 }
    
    override var popupDismissDuration: Double { return dismissDuration ?? 1.0 }
    
    override var popupShouldDismissInteractivelty: Bool { return shouldDismissInteractivelty ?? true }
    
    override var popupDimmingViewAlpha: CGFloat { return BottomPopupConstants.kDimmingViewDefaultAlphaValue }
    
        
    
    //MARK: Outlets
    


    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeLabel2: UILabel!
    @IBOutlet weak var typeLabel3: UILabel!
    
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
        setUpUIControls()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func evolutionBtnAction(_ sender: Any) {
        
        self.movesBtn.backgroundColor = .white
        self.movesBtn.setTitleColor(self.mainColor, for: .normal)
        self.statsBtn.backgroundColor = .white
        self.statsBtn.setTitleColor(self.mainColor, for: .normal)
        self.evolutionsBtn.backgroundColor = self.mainColor
        self.evolutionsBtn.setTitleColor(.white, for: .normal)
        
        
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "evolitionsViewController") as? EvolutionsViewController else { return }
        popupVC.height = view.bounds.height
        popupVC.topCornerRadius = 0
        popupVC.presentDuration = 00.5
        popupVC.dismissDuration = 00.3
        
        //popupVC.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
        popupVC.popupDelegate = self
        popupVC.text = "seteando texto desde el primer VC"
        present(popupVC, animated: true, completion: nil)
        popupVC.pokemonName = self.pokemonName.text
        popupVC.id = self.idPokemon
        popupVC.mainColor = self.mainColor
    }
    
    @IBAction func statsActionBtn(_ sender: Any) {
        self.movesBtn.backgroundColor = .white
        self.movesBtn.setTitleColor(self.mainColor, for: .normal)
        self.statsBtn.backgroundColor = self.mainColor
        self.statsBtn.setTitleColor(.white, for: .normal)
        self.evolutionsBtn.backgroundColor = .white
        self.evolutionsBtn.setTitleColor(self.mainColor, for: .normal)
        
    }
    
    @IBAction func movesActionBtn(_ sender: Any) {
        self.movesBtn.backgroundColor = self.mainColor
        self.movesBtn.setTitleColor(.white, for: .normal)
        self.statsBtn.backgroundColor = .white
        self.statsBtn.setTitleColor(self.mainColor, for: .normal)
        self.evolutionsBtn.backgroundColor = .white
        self.evolutionsBtn.setTitleColor(self.mainColor, for: .normal)
        
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "movesViewController") as? MovesViewController else { return }
        popupVC.height = view.bounds.height
        popupVC.topCornerRadius = 0
        popupVC.presentDuration = 00.4
        popupVC.dismissDuration = 00.3
        
        //popupVC.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
        popupVC.popupDelegate = self
        
        present(popupVC, animated: true, completion: nil)
        popupVC.pokemonName = self.pokemonName.text
        popupVC.id = self.idPokemon
        popupVC.mainColor = self.mainColor
    }
    
    
    @IBAction func hideBtnAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension PokemonViewController{
    
    func setUpUIControls(){
        containerView.layer.cornerRadius = 45
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]

        typeLabel.layer.cornerRadius = 10
        typeLabel.layer.masksToBounds = true
        
        typeLabel3.layer.cornerRadius = 10
        typeLabel3.layer.masksToBounds = true
        
        typeLabel2.layer.cornerRadius = 10
        typeLabel2.layer.masksToBounds = true
       
   
        statsBtn.layer.cornerRadius = 20

        evolutionsBtn.layer.cornerRadius = 20
  
        movesBtn.layer.cornerRadius = 20
        typeLabel2.isHidden = true
        typeLabel3.isHidden = true
        
    }
    
}

extension PokemonViewController{
    //MARK: Networking
    
    func setUpDataPokemon(idPokemon: Int){
        NetworkingProvider.shared.getPokemonData(url:"https://pokeapi.co/api/v2/pokemon/\(idPokemon)") { (pokemonData: PokemonBase) in
            self.pokemonName.text = pokemonData.name
            if let sprites = pokemonData.sprites{
                self.pokemonSprites = sprites
            }
            if let types = pokemonData.types{
                for item in types {
                    print("type name: \(item.type?.name)")
                }
                var i:Int = 0
                while i < types.count {
                    
                    
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
                    if i == 1
                        {self.typeLabel2.isHidden = false
                        self.typeLabel2.text = types[1].type?.name
                        
                        switch types[1].type?.name {
                        case "water":
                            self.typeLabel2.backgroundColor = UIColor.water()
                        case "grass":
                            self.typeLabel2.backgroundColor = UIColor.grass()
                        case "normal":
                            self.typeLabel2.backgroundColor = UIColor.normal()
                        case "fighting":
                            self.typeLabel2.backgroundColor = UIColor.fight()
                        case "poison":
                            self.typeLabel2.backgroundColor = UIColor.poison()
                        case "ground":
                            self.typeLabel2.backgroundColor = UIColor.ground()
                        case "rock":
                            self.typeLabel2.backgroundColor = UIColor.rock()
                        case "bug":
                            self.typeLabel2.backgroundColor = UIColor.bug()
                        case "ghost":
                            self.typeLabel2.backgroundColor = UIColor.ghost()
                        case "steel":
                            self.typeLabel2.backgroundColor = UIColor.steel()
                        case "fire":
                            self.typeLabel2.backgroundColor = UIColor.fire()
                        case "electric":
                            self.typeLabel2.backgroundColor = UIColor.electric()
                        case "psychic":
                            self.typeLabel2.backgroundColor = UIColor.psychic()
                        case "ice":
                            self.typeLabel2.backgroundColor = UIColor.ice()
                        case "dragon":
                            self.typeLabel2.backgroundColor = UIColor.dragon()
                        case "dark":
                            self.typeLabel2.backgroundColor = UIColor.dark()
                        case "fairy":
                            self.typeLabel2.backgroundColor = UIColor.fairy()
                            
                        default:
                            self.typeLabel2.backgroundColor = UIColor.normal()
                            
                        }}
                    if i == 2
                        {self.typeLabel3.isHidden = false
                        self.typeLabel3.text = types[2].type?.name
                        
                        switch types[2].type?.name {
                        case "water":
                            self.typeLabel3.backgroundColor = UIColor.water()
                        case "grass":
                            self.typeLabel3.backgroundColor = UIColor.grass()
                        case "normal":
                            self.typeLabel3.backgroundColor = UIColor.normal()
                        case "fighting":
                            self.typeLabel3.backgroundColor = UIColor.fight()
                        case "poison":
                            self.typeLabel3.backgroundColor = UIColor.poison()
                        case "ground":
                            self.typeLabel3.backgroundColor = UIColor.ground()
                        case "rock":
                            self.typeLabel3.backgroundColor = UIColor.rock()
                        case "bug":
                            self.typeLabel3.backgroundColor = UIColor.bug()
                        case "ghost":
                            self.typeLabel3.backgroundColor = UIColor.ghost()
                        case "steel":
                            self.typeLabel3.backgroundColor = UIColor.steel()
                        case "fire":
                            self.typeLabel3.backgroundColor = UIColor.fire()
                        case "electric":
                            self.typeLabel3.backgroundColor = UIColor.electric()
                        case "psychic":
                            self.typeLabel3.backgroundColor = UIColor.psychic()
                        case "ice":
                            self.typeLabel3.backgroundColor = UIColor.ice()
                        case "dragon":
                            self.typeLabel3.backgroundColor = UIColor.dragon()
                        case "dark":
                            self.typeLabel3.backgroundColor = UIColor.dark()
                        case "fairy":
                            self.typeLabel3.backgroundColor = UIColor.fairy()
                            
                        default:
                            self.typeLabel3.backgroundColor = UIColor.normal()
                            
                        }}
                    
                    
                    
                    i = i + 1
                }
                
               
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
                let highestStat:Float = 250
                self.hpPogress.progress = (Float(stats[0].baseStat!)/highestStat)
                self.atkProgress.progress = (Float(stats[1].baseStat!)/highestStat)
                self.defPogress.progress = (Float(stats[2].baseStat!)/highestStat)
                self.stakProgress.progress = (Float(stats[3].baseStat!)/highestStat)
                self.sdefProgress.progress = (Float(stats[4].baseStat!)/highestStat)
                self.spdProgress.progress = (Float(stats[5].baseStat!)/highestStat)
                
               
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

//MARK: Pop up delegate

extension PokemonViewController: BottomPopupDelegate{
    
}



