//
//  ViewController.swift
//  pokedex
//
//  Created by admin on 2/18/21.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    
    
    
    
    
    //MARK: Variables
    
    
    private let reusableCell:String = "pokemonCell"
    var items: [Displayable] = []
    var selectedItem: Displayable?
    

    //MARK: Outlets
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SeparatorTop: UIView!
    @IBOutlet weak var separatorBottom: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pokemonTableView: UITableView!
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
       
        //table view
        setUpData()

        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let gradientTop = UIColor.setGradient()
        gradientTop.frame = SeparatorTop.bounds
        self.SeparatorTop.layer.addSublayer(gradientTop)
        
        let gradientBottom = UIColor.setGradient()
        gradientBottom.frame = separatorBottom.bounds
        self.separatorBottom.layer.addSublayer(gradientBottom)
              
        super.viewWillAppear(animated)
    }
    
    //MARK: Actions
    
   
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell) as! PokemonCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        let item = self.items[indexPath.row]
        let id = Int(item.urlPokemon.deletingPrefix("https://pokeapi.co/api/v2/pokemon/").dropLast())
        cell.pokemonNameLbl?.text = item.nameLabelText
        let idFormated = String(format: "%03d", id!)
        cell.pokemonNumberLbl?.text = "#\(idFormated)"
        let imageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(String(id!)).png")
        cell.pokemonImage.kf.setImage(with: imageURL)
        
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = items[indexPath.row]
        return indexPath

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? PokemonViewController else {
          return
        }
        destinationVC.data = selectedItem
    }
    
    
    
    
}


extension ViewController{
    //MARK: Networking
    
    func setUpData(){
        NetworkingProvider.shared.getPokemons(url: "https://pokeapi.co/api/v2/", range: "pokemon?limit=100&offset=200") { (pokemon: [Pokemon]) in
            self.items = pokemon
            
            self.tableView.reloadData()
        } failure: { (error: Error?) in
            print(error.debugDescription)
        }
       
    }
    
    
}


